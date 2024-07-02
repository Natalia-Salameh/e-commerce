import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String data;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 317,
      height: 55,
      child: MaterialButton(
        onPressed: onPressed,
        color: CustomColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          data,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: CustomFonts.montserrat),
        ),
      ),
    );
  }
}
