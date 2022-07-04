import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/app/data/common_widgets/loading_widget.dart';
import 'package:firebase_auth_example/app/modules/home/views/home_view.dart';
import 'package:firebase_auth_example/app/modules/screen_signin/views/screen_signin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_authentication_controller.dart';

class ScreenAuthenticationView extends GetView<ScreenAuthenticationController> {
  ScreenAuthenticationView({Key? key}) : super(key: key);

  final authServices = Get.put(ScreenAuthenticationController());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingWidget());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          } else if (snapshot.hasData) {
            return GetBuilder<ScreenAuthenticationController>(
              builder: (context) {
                return  HomeView();
              }
            );
          } else {
            return ScreenSigninView();
          }
        },
      ),
    );
  }
}
