import 'dart:convert';

import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/core/networkHandler.dart';
import 'package:ecommerce/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final LoginUsecase loginUseCase;

  LoginController(this.loginUseCase);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login() async {
    if (formKey.currentState?.validate() ?? false) {
      LoginEntity loginEntity = LoginEntity(
        email: emailController.text,
        password: passwordController.text,
      );

      var response = await loginUseCase.execute(loginEntity);
      handleLoginResponse(response);
    }
  }

  logout() async {
    NetworkHandler.deleteToken();
    Get.offAllNamed(AppRoute.login);
  }

  void handleLoginResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response);
      var jsonResponse = json.decode(response.body);
      var accessToken = jsonResponse['access_token'];
      NetworkHandler.storeToken(accessToken);
      Get.toNamed(AppRoute.home);
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Wrong Email or Password",
      );
      print(response);
    }
  }
}
