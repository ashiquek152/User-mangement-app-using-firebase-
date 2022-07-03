import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/data/common_widgets/textfield_decoration.dart';
import 'package:firebase_auth_example/app/modules/screen_authentication/controllers/screen_authentication_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_change_password_controller.dart';

class ScreenChangePasswordView extends GetView<ScreenChangePasswordController> {
  ScreenChangePasswordView({Key? key}) : super(key: key);

  final forgotController = Get.put(ScreenChangePasswordController());
  final authServices = Get.put(ScreenAuthenticationController());


  @override
  Widget build(BuildContext context) {
    double mqW = MediaQuery.of(context).size.width;
    double mqH = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBG,
      appBar: AppBar(
        title:  Text('Forgot password',style: TextStyle(color: black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: scaffoldBG,
        elevation: 0.0,
        leading: IconButton(
            icon:  Icon(Icons.close, size: 35,color: blue,),
            onPressed: () => Get.back()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("You will recive an email to reset your password",style: TextStyle(color: amber,fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: mqH * 0.025),
            SizedBox(
              height: 70,
              child: TextFormField(
                  decoration: textFieldDecoration("Email"),
                  controller: forgotController.emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? "Enter a valid email"
                          : null),
            ),
            SizedBox(height: mqH * 0.025),
            SizedBox(
              height: mqH * 0.06,
              width: mqW,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: black,
                  ),
                  onPressed: () async{
                    await authServices.verifyResetEmail();
                  },
                  child: const Text("Reset password")),
            ),
          ],
        ),
      ),
    );
  }
}
