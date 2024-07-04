import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:ecommerce/core/shared/search.dart';
import 'package:ecommerce/features/dashboard/presentation/widget/card.dart';
import 'package:ecommerce/features/dashboard/presentation/widget/trendingcard.dart';
import 'package:ecommerce/features/dashboard/presentation/widget/trendingproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: SvgPicture.asset(
                CustomIconAsset.menu,
                height: 24,
                width: 24,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(100),
          child: Row(
            children: [
              Image.asset(
                CustomIconAsset.logo2,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
              const Text(
                "PCNC",
                style: TextStyle(
                    color: CustomColors.pcncColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        actions: [
          GestureDetector(
            child: Image.asset(
              CustomIconAsset.avatar,
              height: 24,
              width: 24,
              fit: BoxFit.scaleDown,
            ),
            onTap: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: MaterialButton(
          onPressed: () {},
          height: 5,
          child: const Text("Log out"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SearchWidget(
                hintText: "Search any Product..",
                icon: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("All Categories",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        child: Image.asset(CustomIconAsset.logo2),
                      ),
                      Text("test"),
                    ],
                  ),
                ],
              ),
              // GridView.count(
              //   crossAxisSpacing: 20,
              //   mainAxisSpacing: 12,
              //   crossAxisCount: 2,
              //   children: [
                  CardWidget(
                    header: "header",
                    description: "description",
                    price: "123",
                  ),
              //   ],
              // ),
              TrendingProductsWidget(),
              TrendingCardWidget(header: "header", price: "price")
            ],
          ),
        ),
      ),
    );
  }
}
