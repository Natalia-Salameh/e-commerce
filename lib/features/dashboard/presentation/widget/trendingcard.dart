import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class TrendingCardWidget extends StatelessWidget {
  final String header;
  final String price;
  final List<String> images;

  const TrendingCardWidget(
      {super.key,
      required this.header,
      required this.price,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 142,
          height: 186,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SizedBox(
              //   width: 142,
              //   height: 100,
              //   child:
              Expanded(
                child: InstaImageViewer(
                  child: Image.network(
                    images.first,
                    errorBuilder: (context, error, stackTrace) {
                      print('Error loading image: $error');
                      return const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.image_not_supported,
                            color: Colors.white),
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // ),
              Text(
                header,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              Text(
                "\$$price",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
