import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/core/validation/loginValidation.dart';
import 'package:ecommerce/features/auth/presentation/controller/login_controller.dart';
import 'package:ecommerce/features/auth/presentation/widget/button.dart';
import 'package:ecommerce/features/auth/presentation/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: 192,
                child: Text(
                  'Welcome Back!',
                  style: GoogleFonts.montserrat(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: loginController.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      hintText: 'Username or Email',
                      controller: loginController.emailController,
                      icon: SvgPicture.asset(
                        CustomIconAsset.person,
                        colorFilter: CustomColors.textFieldIconColorLogin,
                        height: 24,
                        width: 24,
                        fit: BoxFit.scaleDown,
                      ),
                      validator: (value) => validLoginInput(value!, 'Email or Username'),
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      hintText: 'Password',
                      controller: loginController.passwordController,
                      icon: SvgPicture.asset(
                        CustomIconAsset.password,
                        colorFilter: CustomColors.textFieldIconColorLogin,
                        height: 24,
                        width: 24,
                        fit: BoxFit.scaleDown,
                      ),
                      obscureText: true,
                      validator: (value) => validLoginInput(value!, 'Password'),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.authOrangeColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                onPressed: () {
                  loginController.login();
                },
                data: 'Login',
              ),
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.signUp);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Create An Account  ',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.accountColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.authOrangeColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
