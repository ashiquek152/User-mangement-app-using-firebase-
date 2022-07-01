import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/modules/screen_authentication/controllers/screen_authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

InputDecoration textFieldDecoration(String hintText) {
  final authController = Get.put(ScreenAuthenticationController());
  return InputDecoration(
    contentPadding: const EdgeInsets.all(10),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black38),
    filled: true,
    fillColor: white,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: white,
      ),
    ),
    suffixIcon: Visibility(
        visible: hintText == "Password" ? true : false,
        child: IconButton(
            onPressed: () =>
                authController.passwordVisibility(),
            icon:  Icon(Icons.remove_red_eye_outlined,
            color: authController.passwordVisible==false?blue:Colors.black38,),
          )),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: white,
        width: 2.0,
      ),
    ),
  );
}
