import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:ecommerce/core/shared/search.dart';
import 'package:ecommerce/features/categories/presentation/widget/categorycard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.homePageBackgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.homePageBackgroundColor,
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
          child: Text(
            "Categories",
            style: GoogleFonts.libreCaslonText(
                color: CustomColors.pcncColor,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      drawer: Drawer(
        child: MaterialButton(
          onPressed: () {},
          height: 5,
          child: const Text("Log out"),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            SearchWidget(
              hintText: "Search any category..",
              icon: Icon(Icons.search),
            ),
            SizedBox(
              height: 40,
            ),
            CategoryCardWidget(
              header: "header",
            ),
          ]),
        ),
      ),
    );
  }
}
