import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/core/di/bindings.dart';
import 'package:ecommerce/features/auth/presentation/view/login.dart';
import 'package:ecommerce/features/auth/presentation/view/signup.dart';
import 'package:ecommerce/features/categories/presentation/view/categories.dart';
import 'package:ecommerce/features/dashboard/presentation/view/home.dart';
import 'package:ecommerce/features/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.signUp,
    page: () => SignUpPage(),
    binding: AppBindings(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => LogIn(),
    binding: AppBindings(),
  ),
  GetPage(
    name: AppRoute.home,
    page: () => Home(),
  ),
  GetPage(
    name: AppRoute.category,
    page: () => Categories(),
  ),
  GetPage(
    name: AppRoute.splashScreen,
    page: () => SplashScreen(),
  )
];
