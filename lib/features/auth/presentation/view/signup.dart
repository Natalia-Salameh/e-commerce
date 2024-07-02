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

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const SizedBox(
                  width: 192,
                  child: Text('Create an account',
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: CustomFonts.montserrat,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                const SizedBox(height: 45),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldWidget(
                        hintText: 'Username',
                        controller: TextEditingController(),
                        icon: SvgPicture.asset(
                          CustomIconAsset.person,
                          colorFilter: CustomColors.textFieldIconColorSignUp,
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        hintText: 'Email',
                        controller: TextEditingController(),
                        icon: SvgPicture.asset(
                          CustomIconAsset.email,
                          colorFilter: CustomColors.textFieldIconColorSignUp,
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        obscureText: true,
                        hintText: 'Password',
                        controller: TextEditingController(),
                        icon: SvgPicture.asset(
                          CustomIconAsset.password,
                          colorFilter: CustomColors.textFieldIconColorSignUp,
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        obscureText: true,
                        hintText: 'ConfirmPassword',
                        controller: TextEditingController(),
                        icon: SvgPicture.asset(
                          CustomIconAsset.password,
                          colorFilter: CustomColors.textFieldIconColorSignUp,
                          height: 24,
                          width: 24,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 258,
                  child: RichText(
                    text: const TextSpan(
                      text: "By clicking the ",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: CustomFonts.montserrat,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.textFieldHintColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: CustomFonts.montserrat,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.authOrangeColor,
                          ),
                        ),
                        TextSpan(
                          text: " button, you agree to the public offer",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: CustomFonts.montserrat,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.textFieldHintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                ButtonWidget(
                  onPressed: () {},
                  data: 'Create Account',
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.login);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'I Already Have an Account  ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: CustomFonts.poppins,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.accountColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'Login',
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
      ),
    );
  }
}
