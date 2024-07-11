import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final SvgPicture icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final LoginController loginController = Get.find();

  TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 317,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          filled: true,
          fillColor: CustomColors.textFieldBackgroundColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: CustomColors.textFieldHintColor,
            fontSize: 12,
          ),
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: CustomColors.textFieldBorderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.buttonColor),
          ),
          suffixIcon: obscureText
              ? GestureDetector(
                  onTap: () {
                    loginController.toggleObsecure();
                  },
                  child: Icon(loginController.isObsecure.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                )
              : null,
        ),
        obscureText: obscureText,
        validator: validator,
      ),
    );
  }
}
