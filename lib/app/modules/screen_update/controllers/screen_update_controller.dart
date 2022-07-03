import 'package:firebase_auth_example/app/data/common_widgets/image_picker_controller.dart';
import 'package:firebase_auth_example/app/data/firebase_database/fire_database.dart';
import 'package:firebase_auth_example/app/data/firebase_database/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenUpdateController extends GetxController {
//   final data;

// ScreenUpdateController({this.data});
  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final jobController = TextEditingController();
  final numberController = TextEditingController();
  final imgContoller =Get.put(ImageController());

  // Update Userdata
  Future updateData(String email,String uid,var image) async {
    await FirebaseDB().updateUserData(UserModel(
      email: email,
      job: jobController.text.trim(),
      name: userNameController.text.trim(),
      number: numberController.text.trim(),
      imageString: imgContoller.stringOfimg==""?image:imgContoller.stringOfimg,
      uid: uid,
    ));
    imgContoller.stringOfimg="";
    // Get.back();
  }
}
