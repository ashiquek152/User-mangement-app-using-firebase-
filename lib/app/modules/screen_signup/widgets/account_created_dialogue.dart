import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/modules/screen_signin/views/screen_signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AccountCreated extends StatelessWidget {
  const AccountCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 250, 20, 150),
        color: white,
        child: Column(
          children: [
            Lottie.asset(
              repeat: false,
              "assets/account-created-thank-you.json",
              fit: BoxFit.contain,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () {
                Get.offAll(
                  () => ScreenSigninView(),
                  transition: Transition.fade,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const Text("Login now"),
            )
          ],
        ));
  }
}
