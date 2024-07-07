import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final SvgPicture icon;
  final bool obscureText;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
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
            borderSide:
                const BorderSide(color: CustomColors.textFieldBorderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: CustomColors.buttonColor),
          ),
          suffixIcon: obscureText
              ? SvgPicture.asset(
                  CustomIconAsset.eye,
                  colorFilter: CustomColors.textFieldIconColorLogin,
                  height: 24,
                  width: 24,
                  fit: BoxFit.scaleDown,
                )
              : null,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
