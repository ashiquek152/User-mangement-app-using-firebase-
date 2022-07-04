import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/data/common_widgets/textfield_decoration.dart';
import 'package:firebase_auth_example/app/modules/screen_authentication/controllers/screen_authentication_controller.dart';
import 'package:firebase_auth_example/app/modules/screen_change_password/views/screen_change_password_view.dart';
import 'package:firebase_auth_example/app/modules/screen_signup/views/screen_signup_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/screen_signin_controller.dart';

class ScreenSigninView extends GetView<ScreenSigninController> {
  ScreenSigninView({Key? key}) : super(key: key);

  final authServices = Get.put(ScreenAuthenticationController());
  final signInController = Get.put(ScreenSigninController());

  @override
  Widget build(BuildContext context) {
    double mqW = MediaQuery.of(context).size.width;
    double mqH = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: scaffoldBG,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0.0),
            child: Form(
              key: signInController.signformKey,
              child: ListView(
                children: [
                  Container(
                      child: Lottie.asset(
                    "assets/signup.json",
                    fit: BoxFit.fill,
                  )),
                  SizedBox(height: mqH * 0.03),
                  SizedBox(
                    height: mqH * 0.06,
                    child: TextFormField(
                        decoration: textFieldDecoration("Email"),
                        controller: signInController.emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? "Enter a valid email"
                                : null),
                  ),
                  SizedBox(height: mqH * 0.015),
                  SizedBox(
                    height: mqH * 0.06,
                    child: GetBuilder<ScreenAuthenticationController>(
                        builder: (context) {
                      return TextFormField(
                        decoration: textFieldDecoration("Password"),
                        controller: signInController.passwordController,
                        validator: (password) =>
                            password != null && password.length < 6
                                ? "Enter min 6 characters"
                                : null,
                        obscureText: authServices.passwordVisible,
                      );
                    }),
                  ),
                  SizedBox(height: mqH * 0.025),
                  SizedBox(
                    height: mqH * 0.06,
                    width: mqW,
                    child: ElevatedButton.icon(
                        icon: const Icon(Icons.gpp_good_outlined),
                        style: ElevatedButton.styleFrom(
                          primary: black,
                        ),
                        onPressed: () async {
                          await authServices.signInWithEmail();
                        },
                        label: const Text("Sign in")),
                  ),
                  SizedBox(height: mqH * 0.03),
                  Center(
                    child: SizedBox(
                      height: mqH * 0.06,
                      width: mqW * 0.5,
                      // color: red,
                      child: Row(
                        children: [
                          Container(
                            height: mqH * 0.04,
                            width: mqW * 0.14,
                            decoration: const BoxDecoration(
                                // color: blue,
                                image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/Google.png"),
                            )),
                          ),
                          const Text("Sign In with Google ")
                        ],
                      ),
                      // decoration: BoxDecoration(),
                    ),
                  ),
                  SizedBox(height: mqH * 0.03),
                  Center(
                    child: GestureDetector(
                      onTap: (() => Get.to(ScreenChangePasswordView())),
                      child: Text(
                        "Forgot password ?",
                        style: TextStyle(
                          color: amber,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mqH * 0.03),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Need an account ? ",
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: mqH * 0.019,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => Get.to(() => ScreenSignupView()),
                              text: "REGISTER HERE",
                              style: TextStyle(
                                decorationColor: red,
                                decoration: TextDecoration.underline,
                                fontSize: mqH * 0.02,
                                color: red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
