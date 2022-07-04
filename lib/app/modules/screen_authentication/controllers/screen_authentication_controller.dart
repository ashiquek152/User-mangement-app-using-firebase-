import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/data/common_widgets/image_picker_controller.dart';
import 'package:firebase_auth_example/app/data/common_widgets/loading_widget.dart';
import 'package:firebase_auth_example/app/data/firebase_database/fire_database.dart';
import 'package:firebase_auth_example/app/data/firebase_database/user_data_model.dart';
import 'package:firebase_auth_example/app/modules/screen_change_password/controllers/screen_change_password_controller.dart';
import 'package:firebase_auth_example/app/modules/screen_signin/controllers/screen_signin_controller.dart';
import 'package:firebase_auth_example/app/modules/screen_signin/views/screen_signin_view.dart';
import 'package:firebase_auth_example/app/modules/screen_signup/controllers/screen_signup_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAuthenticationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.ref();
  final signInController = Get.put(ScreenSigninController());
  final signupController = Get.put(ScreenSignupController());
  final forgotController = Get.put(ScreenChangePasswordController());
  final imageController = Get.put(ImageController());
  bool passwordVisible = true;
  // RxBool loading = false.obs;

  // Password obscure text visibility change
  passwordVisibility() {
    passwordVisible = !passwordVisible;
    update();
  }

  //  sign in with email and password
  Future signInWithEmail() async {
    final isValid =signInController.signformKey.currentState!.validate();
    if (!isValid) return;
    Get.dialog(const LoadingWidget());
    try {
      await _auth.signInWithEmailAndPassword(
        email: signInController.emailController.text.trim(),
        password: signInController.passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      final erroMessage = e.message;
      Get.snackbar("Error", "",
          snackStyle: SnackStyle.GROUNDED,
          messageText: Text(
            erroMessage.toString(),
            style: TextStyle(color: red),
          ));
    }
    Get.back();
  }

// signUp with Email and Password
  Future signUp() async {
     imageController.stringOfimg == ""
        ? Get.snackbar("Please choose an image", "")
        : null;
    final isValid =imageController.stringOfimg!=""&& signupController.formKey.currentState!.validate();
    if (!isValid) return;
    Get.dialog(const LoadingWidget());
    try {
      UserCredential results = await _auth.createUserWithEmailAndPassword(
          email: signupController.emailController.text.trim(),
          password: signupController.passwordController.text.trim());
      User user = results.user!;

      await FirebaseDB().createUserData(UserModel(
        imageString: imageController.stringOfimg,
        name: signupController.userNameController.text.trim(),
        job: signupController.jobController.text.trim(),
        number: signupController.numberController.text.trim(),
        email: user.email.toString(),
        uid: user.uid,
      ));
      clearFields();
    } on FirebaseAuthException catch (e) {
      final erroMessage = e.message;
      Get.snackbar("Error", "",
          snackStyle: SnackStyle.GROUNDED,
          messageText: Text(
            erroMessage.toString(),
            style: TextStyle(color: red),
          ));
    }
    Get.back();
    Get.back();
  }

//  Verify reset password Email
  Future verifyResetEmail() async {
    Get.dialog(const LoadingWidget());
    try {
      await _auth.sendPasswordResetEmail(
          email: forgotController.emailController.text.trim());
      Get.snackbar("", "",
          snackStyle: SnackStyle.GROUNDED,
          titleText: Text(
            "Email has been sent",
            style: TextStyle(color: white),
          ));
      Get.offAll(ScreenSigninView());
    } on FirebaseAuthException catch (e) {
      final erroMessage = e.message;
      Get.snackbar("", "",
          snackStyle: SnackStyle.GROUNDED,
          titleText: Text(
            erroMessage.toString(),
            style: TextStyle(color: white),
          ));
    }
    Get.back();
  }
  
  clearFields()async{
    signupController.userNameController.text = "";
    signupController.jobController.text = "";
    signupController.emailController.text = "";
    signupController.passwordController.text = "";
    signupController.numberController.text = "";
    imageController.stringOfimg = "";
  }
}

