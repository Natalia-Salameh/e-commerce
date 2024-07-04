import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:flutter/material.dart';

class TrendingCardWidget extends StatelessWidget {
  final String header;
  final String price;

  const TrendingCardWidget({
    super.key,
    required this.header,
    required this.price,
  });

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
              SizedBox(
                  width: 142,
                  height: 100,
                  child: Image.asset(CustomIconAsset.logo2)),
              Text(
                header,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
