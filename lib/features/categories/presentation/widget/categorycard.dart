import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCardWidget extends StatelessWidget {
  final String header;

  const CategoryCardWidget({
    super.key,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 164,
          height: 245,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  width: 164,
                  height: 136,
                  child: Image.asset(CustomIconAsset.logo2)),
              Text(
                header,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
