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
              InstaImageViewer(
                child: SizedBox(
                  width: 164,
                  height: 136,
                  child: Image.network(
                    image,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child:
                            Icon(Icons.image_not_supported, color: Colors.white),
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
