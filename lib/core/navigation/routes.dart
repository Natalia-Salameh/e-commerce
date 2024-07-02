import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/features/auth/presentation/view/login.dart';
import 'package:ecommerce/features/auth/presentation/view/signup.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(name: AppRoute.login, page: () => LogIn()),
];
