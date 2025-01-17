import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/core/networkHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    String? accessToken = await NetworkHandler.getToken();
    await Future.delayed(Duration(seconds: 3), () {});
    accessToken == null
        ? Get.toNamed(AppRoute.signUp)
        : Get.toNamed(AppRoute.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icons/imagee.png'),
      ),
    );
  }
}
