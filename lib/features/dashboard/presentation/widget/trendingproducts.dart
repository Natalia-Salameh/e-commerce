import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TrendingProductsWidget extends StatelessWidget {
  const TrendingProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.pcncColor,
      child: ListTile(
        textColor: CustomColors.backgroundColor,
        iconColor: CustomColors.backgroundColor,
        title: const Text(
          "Trending Products",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: const Row(
          children: [
            Icon(Icons.calendar_month_outlined),
            SizedBox(
              width: 5,
            ),
            Text(
              "Last Date 29/02/22",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: CustomColors.backgroundColor),
          ),
          onPressed: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "View all",
                style: TextStyle(color: CustomColors.backgroundColor),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: CustomColors.backgroundColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
