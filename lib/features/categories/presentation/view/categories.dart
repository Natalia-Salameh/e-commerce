import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:ecommerce/core/shared/CircularIndicator.dart';
import 'package:ecommerce/core/shared/dialogWidget.dart';
import 'package:ecommerce/core/shared/search.dart';
import 'package:ecommerce/features/auth/presentation/controller/login_controller.dart';
import 'package:ecommerce/features/categories/presentation/widget/categorycard.dart';
import 'package:ecommerce/features/dashboard/presentation/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final LoginController loginController = Get.find();

  final CategoryController categoryController = Get.find();

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
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: 'Confirmation',
                      content: 'Are you sure you want to log out?',
                      buttonText: "Log out",
                      onAccept: () {
                        loginController.logout();
                      },
                      onCancel: () {
                        categoryController.back();
                      },
                    );
                  },
                );
              },
              height: 5,
              child: const Text("Log out"),
            ),
            MaterialButton(
              onPressed: () {
                categoryController.getToHome();
              },
              height: 5,
              child: const Text("Go to home"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const SearchWidget(
              hintText: "Search any category..",
              icon: Icon(Icons.search),
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(() {
              if (categoryController.categories.isEmpty) {
                return const Center(child: CustomProgressIndicator());
              } else {
                return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                  childAspectRatio: 0.77,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: categoryController.categories.map((category) {
                    return CategoryCardWidget(
                      header: category.name,
                      image: category.image,
                    );
                  }).toList(),
                );
              }
            }),
          ]),
        ),
      ),
    );
  }
}
