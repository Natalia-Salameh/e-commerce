import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:ecommerce/core/constants/routes.dart';
import 'package:ecommerce/features/auth/presentation/widget/button.dart';
import 'package:ecommerce/features/auth/presentation/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                SizedBox(
                  width: 192,
                  child: Text(
                    'Create an account',
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Form(
                  key: key,
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
                    text: TextSpan(
                      text: "By clicking the ",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.textFieldHintColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.authOrangeColor,
                          ),
                        ),
                        TextSpan(
                          text: " button, you agree to the public offer",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
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
                      text: TextSpan(
                        text: 'I Already Have an Account  ',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.accountColor,
                        ),
                        children: [
                          TextSpan(
                              text: 'Login',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: CustomColors.authOrangeColor,
                                decoration: TextDecoration.underline,
                              )),
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
