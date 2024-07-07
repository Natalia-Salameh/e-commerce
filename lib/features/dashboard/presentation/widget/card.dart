import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final String header;
  final String description;
  final String price;

  const CardWidget({
    super.key,
    required this.header,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 170,
          height: 241,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  width: 170,
                  height: 124,
                  child: Image.asset(CustomIconAsset.logo2)),
              Text(
                header,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
              Text(
                price,
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
      ),
    );
  }
}
