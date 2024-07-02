import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/fonts.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/features/auth/presentation/widget/button.dart';
import 'package:ecommerce/features/auth/presentation/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

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
              const SizedBox(
                width: 192,
                child: Text('Welcome Back!',
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: CustomFonts.montserrat,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              const SizedBox(height: 15),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      hintText: 'Username or Email',
                      controller: TextEditingController(),
                      icon: SvgPicture.asset(
                        CustomIconAsset.person,
                        colorFilter: CustomColors.textFieldIconColorLogin,
                        height: 24,
                        width: 24,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      hintText: 'Password',
                      controller: TextEditingController(),
                      icon: SvgPicture.asset(
                        CustomIconAsset.password,
                        colorFilter: CustomColors.textFieldIconColorLogin,
                        height: 24,
                        width: 24,
                        fit: BoxFit.scaleDown,
                      ),
                      obscureText: true,
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
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: CustomFonts.montserrat,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.authOrangeColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                onPressed: () {},
                data: 'Login',
              ),
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.signUp);
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Create An Account  ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: CustomFonts.poppins,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.accountColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: CustomFonts.montserrat,
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
