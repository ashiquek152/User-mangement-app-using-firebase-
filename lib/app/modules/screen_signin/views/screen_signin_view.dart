import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/data/common_widgets/textfield_decoration.dart';
import 'package:firebase_auth_example/app/modules/home/views/home_view.dart';
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
                  ),
                ),
                SizedBox(height: mqH * 0.015),
                SizedBox(
                  height: mqH * 0.06,
                  child: GetBuilder<ScreenAuthenticationController>(
                      builder: (context) {
                    return TextFormField(
                      decoration: textFieldDecoration("Password"),
                      controller: signInController.passwordController,
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
                        primary: Colors.black,
                      ),
                      onPressed: () async {
                        await authServices.signInWithEmail(context);
                        Get.off(HomeView());
                      },
                      label: const Text("Sign in")),
                ),
                SizedBox(height: mqH * 0.03),
                Center(
                  child: GestureDetector(
                    onTap: (() => Get.to( ScreenChangePasswordView())),
                    child: Text(
                      "Forgot password ?",
                      style: TextStyle(
                        color: blue,
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
                          fontSize: mqH * 0.019,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => ScreenSignupView()),
                            text: "REGISTER HERE",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: mqH * 0.02,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}