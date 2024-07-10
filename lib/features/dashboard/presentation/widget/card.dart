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
    Key? key,
    required this.header,
    required this.description,
    required this.price,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: InstaImageViewer(
                child: Image.network(
                  images.first,
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
            Text(
              header,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
              child: Text(
                description,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ),
            Text(
              "\$$price",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                    SvgPicture.asset(
                      CustomIconAsset.save,
                      height: 20,
                      width: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
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
    );
  }
}
