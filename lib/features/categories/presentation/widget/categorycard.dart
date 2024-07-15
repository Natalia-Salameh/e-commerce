import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class CategoryCardWidget extends StatelessWidget {
  final String header;
  final String image;

  const CategoryCardWidget(
      {super.key, required this.header, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 245,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 2),
              color: Color.fromRGBO(0, 0, 0, 0.15))
        ],
        color: CustomColors.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InstaImageViewer(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              height: 136,
              child: Image.network(
                image,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.image_not_supported, color: Colors.white),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              header,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
