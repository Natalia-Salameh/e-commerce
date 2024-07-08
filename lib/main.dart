import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/core/constants/theme.dart';
import 'package:ecommerce/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoute.splashScreen,
      getPages: routes,
      theme: AppTheme.lightTheme,
    );
  }
}
