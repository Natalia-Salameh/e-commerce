import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class CardWidget extends StatelessWidget {
  final String header;
  final String description;
  final String price;
  final List<String> images;

  const CardWidget({
    super.key,
    required this.header,
    required this.description,
    required this.price,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.70,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 300,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: CustomColors.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 124,
              width: 170,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: InstaImageViewer(
                child: Image.network(
                  images.first,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return const CircleAvatar(
                      backgroundColor: CustomColors.backgroundColor,
                      child:
                          Icon(Icons.image_not_supported, color: Colors.white),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "\$$price",
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            CustomIconAsset.heart,
                            height: 20,
                            width: 20,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.bookmark),
                        ],
                      ),
                      SizedBox(width: 70),
                      SvgPicture.asset(
                        CustomIconAsset.cart,
                        height: 20,
                        width: 20,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
