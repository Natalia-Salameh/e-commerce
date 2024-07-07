import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final Icon icon;

  const SearchWidget({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 343,
        child: Material(
          elevation: 5,
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.04),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              fillColor: CustomColors.textFieldBackgroundColor,
              hintText: hintText,
              hintStyle: GoogleFonts.montserrat(
                color: CustomColors.textFieldHintColor,
                fontSize: 12,
              ),
              prefixIcon: icon,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: CustomColors.buttonColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
