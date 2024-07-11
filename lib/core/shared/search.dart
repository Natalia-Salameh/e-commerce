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
      child: Container(
        height: 40,
        width: 360,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 9,
                offset: Offset(0, 2),
                color: Color.fromRGBO(0, 0, 0, 0.04))
          ],
          color: CustomColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(6),
            fillColor: CustomColors.textFieldBackgroundColor,
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              color: Color.fromRGBO(187, 187, 187, 1),
              fontSize: 12,
            ),
            prefixIcon: Icon(
              icon.icon,
              color: Color.fromRGBO(187, 187, 187, 1),
              size: 20,
            ),
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
    );
  }
}
