import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/data/common_widgets/image_picker_controller.dart';
import 'package:firebase_auth_example/app/data/common_widgets/textfield_decoration.dart';
import 'package:firebase_auth_example/app/modules/screen_authentication/controllers/screen_authentication_controller.dart';
import 'package:firebase_auth_example/app/modules/screen_signin/views/screen_signin_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_signup_controller.dart';

class ScreenSignupView extends GetView<ScreenSignupController> {
  ScreenSignupView({Key? key}) : super(key: key);

  final authServices = Get.put(ScreenAuthenticationController());
  final signUpController = Get.put(ScreenSignupController());
  final imgControler = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    double mqW = MediaQuery.of(context).size.width;
    double mqH = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: scaffoldBG,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 0.0),
            child: Form(
              key: signUpController.formKey,
              child: ListView(
                children: [
                  GetBuilder<ImageController>(builder: (ctx) {
                    return ctx.stringOfimg == ''
                        ? CircleAvatar(
                            radius: 70,
                            backgroundColor: white,
                            child: const SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipOval(
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/sample2.jpg"))),
                            ),
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundColor: white,
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: MemoryImage(
                                    const Base64Decoder()
                                        .convert(ctx.stringOfimg),
                                  ),
                                ),
                              ),
                            ),
                          );
                  }),
                  IconButton(
                      onPressed: () {
                        imgControler.pickCameraImage();
                      },
                      icon: Icon(
                        Icons.camera,
                        color: amber,
                      )),
                  SizedBox(height: mqH * 0.01),
                  SizedBox(
                    height: 70,
                    child: GetBuilder<ScreenAuthenticationController>(
                        builder: (context) {
                      return TextFormField(
                        maxLength: 15,
                        decoration: textFieldDecoration("Username"),
                        controller: signUpController.userNameController,
                        validator: (username) =>
                            username != null && username.length < 4
                                ? "Enter min 4 characters"
                                : null,
                      );
                    }),
                  ),
                  SizedBox(height: mqH * 0.01),
                  SizedBox(
                    height: 70,
                    child: GetBuilder<ScreenAuthenticationController>(
                        builder: (context) {
                      return TextFormField(
                        maxLength: 10,
                        decoration: textFieldDecoration("Mobile Number"),
                        controller: signUpController.numberController,
                        validator: (number) =>
                            number != null && number.length < 10
                                ? "Must be 10 numbers"
                                : null,
                      );
                    }),
                  ),
                  SizedBox(height: mqH * 0.01),
                  SizedBox(
                    height: 70,
                    child: GetBuilder<ScreenAuthenticationController>(
                        builder: (context) {
                      return TextFormField(
                        maxLength: 15,
                        decoration: textFieldDecoration("Occupation"),
                        controller: signUpController.jobController,
                        validator: (occupation) =>
                            occupation != null && occupation.length < 4
                                ? "Enter min 4 characters"
                                : null,
                      );
                    }),
                  ),
                  SizedBox(height: mqH * 0.01),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                        decoration: textFieldDecoration("Email"),
                        controller: signUpController.emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? "Enter a valid email"
                                : null),
                  ),
                  SizedBox(height: mqH * 0.01),
                  SizedBox(
                    height: 70,
                    child: GetBuilder<ScreenAuthenticationController>(
                        builder: (context) {
                      return TextFormField(
                        maxLength: 15,
                        decoration: textFieldDecoration("Password"),
                        controller: signUpController.passwordController,
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
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: black,
                        ),
                        onPressed: () async => await authServices.signUp(),
                        child: const Text("Register")),
                  ),
                  SizedBox(height: mqH * 0.03),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Have an account ? ",
                          style: TextStyle(
                            fontSize: mqH * 0.019,
                            color: black,
                            fontWeight: FontWeight.bold
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => Get.offAll(() => ScreenSigninView()),
                              text: "Sign in",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: mqH * 0.02,
                                color: red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(height: mqH * 0.03),
                ],
              ),
            ),
          ),
        ));
  }
}
