import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/features/auth/domain/entities/login_entity.dart';
import 'package:ecommerce/features/auth/domain/entities/signup_entity.dart';
import 'package:ecommerce/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ecommerce/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final LoginController loginController = Get.find();
  final SignupUseCase signupUseCase;

  SignUpController(this.signupUseCase);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  signUp() async {
    if (formKey.currentState?.validate() ?? false) {
      SignUpEntity signupEntity = SignUpEntity(
        email: emailController.text,
        name: usernameController.text,
        password: passwordController.text,
        role: 'customer',
        avatar:
            'https://gravatar.com/avatar/24afa01781bfcf0d543b4f9224bf5067?s=400&d=robohash&r=x',
      );

      var data = await signupUseCase.execute(signupEntity);
      handleSignupResponse(data);
    }
  }

  Future<void> handleSignupResponse(http.Response data) async {
    if (data.statusCode == 200 || data.statusCode == 201) {
      LoginEntity loginEntity = LoginEntity(
        email: emailController.text,
        password: passwordController.text,
      );

      var response = await loginController.loginUseCase.execute(loginEntity);
      loginController.handleLoginResponse(response);
      print(data);
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Please Enter correct data",
      );
      print(data);
    }
  }

  // @override
  // void onClose() {
  //   usernameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   confirmPasswordController.dispose();
  //   super.onClose();
  // }
}
