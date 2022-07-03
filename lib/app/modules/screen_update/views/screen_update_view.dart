import 'dart:convert';

import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/data/common_widgets/image_picker_controller.dart';
import 'package:firebase_auth_example/app/data/common_widgets/textfield_decoration.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_update_controller.dart';

class ScreenUpdateView extends GetView<ScreenUpdateController> {
  ScreenUpdateView({this.data, Key? key}) : super(key: key);

  final data;

  final updateController = Get.put(ScreenUpdateController());
  final imgControler = Get.put(ImageController());
  final authServices = Get.put(ScreenUpdateController());
  @override
  Widget build(BuildContext context) {
    updateController.userNameController.text = data["name"];
    updateController.numberController.text = data["number"];
    updateController.emailController.text = data["email"];
    updateController.jobController.text = data["job"];

    // print(data);

    return Scaffold(
        backgroundColor: scaffoldBG,
        appBar: AppBar(
          backgroundColor: scaffoldBG,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.clear_outlined,
                size: 40,
                color: blue,
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 0.0),
            child: Form(
              key: updateController.formKey,
              child: ListView(
                children: [
                 GetBuilder<ImageController>(builder: (ctx) {
                          return imgControler.stringOfimg == ''
                      ? CircleAvatar(
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
                                    .convert(data["stringImg"]),
                              ),
                            )),
                          ),
                        )
                      :  CircleAvatar(
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
                      onPressed: () async {
                       await imgControler.bottomSheet();
                      },
                      icon: Icon(
                        Icons.camera,
                        color: red,
                      )),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 70,
                    child:
                        GetBuilder<ScreenUpdateController>(builder: (context) {
                      return TextFormField(
                        maxLength: 15,
                        decoration: textFieldDecoration("Username"),
                        controller: updateController.userNameController,
                        validator: (username) =>
                            username != null && username.length < 4
                                ? "Enter min 4 characters"
                                : null,
                      );
                    }),
                  ),
                  // SizedBox(height: mqH * 0.01),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 70,
                    child:
                        GetBuilder<ScreenUpdateController>(builder: (context) {
                      return TextFormField(
                        maxLength: 10,
                        decoration: textFieldDecoration("Mobile Number"),
                        controller: updateController.numberController,
                        validator: (number) =>
                            number != null && number.length < 10
                                ? "Must be 10 numbers"
                                : null,
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 70,
                    child:
                        GetBuilder<ScreenUpdateController>(builder: (context) {
                      return TextFormField(
                        maxLength: 15,
                        decoration: textFieldDecoration("Occupation"),
                        controller: updateController.jobController,
                        validator: (occupation) =>
                            occupation != null && occupation.length < 4
                                ? "Enter min 4 characters"
                                : null,
                      );
                    }),
                  ),
                  SizedBox(
                    height: 50,
                    // width: ,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: black,
                        ),
                        onPressed: () async => await updateController
                            .updateData(
                                data["email"].toString(), data["id"].toString(),data["stringImg"].toString())
                            .whenComplete(() => Get.back()),
                        child: const Text("Save")),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
