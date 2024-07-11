import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/core/shared/dialogWidget.dart';
import 'package:ecommerce/core/shared/search.dart';
import 'package:ecommerce/features/auth/presentation/controller/login_controller.dart';
import 'package:ecommerce/features/dashboard/presentation/controller/category_controller.dart';
import 'package:ecommerce/features/dashboard/presentation/controller/product_controller.dart';
import 'package:ecommerce/features/dashboard/presentation/widget/card.dart';
import 'package:ecommerce/features/dashboard/presentation/widget/navigation.dart';
import 'package:ecommerce/features/dashboard/presentation/widget/trendingcard.dart';
import 'package:ecommerce/features/dashboard/presentation/widget/trendingproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final CategoryController categoryController = Get.find();
  final LoginController loginController = Get.find();
  final ProductController productController = Get.find();

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
          child: Row(
            children: [
              Image.asset(
                CustomIconAsset.logo2,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 8),
              Text(
                "PCNC",
                style: GoogleFonts.libreCaslonText(
                  color: CustomColors.pcncColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
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
                    Get.back();
                  },
                );
              },
            );
          },
          height: 50,
          child: const Text("Log out"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(
                hintText: "Search any Product..",
                icon: Icon(Icons.search),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "All Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Material(
                      elevation: 4,
                      shadowColor: Color.fromRGBO(0, 0, 0, 0.08),
                      child: SizedBox(
                        height: 30,
                        width: 75,
                        child: GestureDetector(
                          onTap: () {
                            categoryController.getToCategory();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 24,
                            width: 57,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: CustomColors.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 16,
                                      offset: Offset(1, 1),
                                      color: Color.fromRGBO(0, 0, 0, 0.08))
                                ]),
                            child: Text(
                              "See All",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () {
                  if (categoryController.categories.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categoryController.categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                    child: Image.network(
                                      category.image,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        print('Error loading image: $error');
                                        return const CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          child: Icon(Icons.image_not_supported,
                                              color: Colors.white),
                                        );
                                      },
                                      fit: BoxFit.cover,
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(category.name),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              Obx(() {
                if (productController.products.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.count(
                    childAspectRatio: 0.77,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: productController.products.map((product) {
                      return SizedBox(
                        width: double.infinity,
                        child: CardWidget(
                          header: product.title,
                          description: product.description,
                          price: product.price.toString(),
                          images: product.images,
                        ),
                      );
                    }).toList(),
                  );
                }
              }),
              const SizedBox(height: 16),
              const TrendingProductsWidget(),
              const SizedBox(height: 16),
              Obx(
                () {
                  if (productController.products.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: productController.products.map((product) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TrendingCardWidget(
                                    header: product.title,
                                    price: product.price.toString(),
                                    images: product.images),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBarWidget(currentIndex: 0),
    );
  }
}
