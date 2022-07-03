import 'dart:convert';

import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/modules/home/views/home_view.dart';
import 'package:firebase_auth_example/app/modules/screen_profile/widgets/profile_tiles.dart';
import 'package:firebase_auth_example/app/modules/screen_update/views/screen_update_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_profile_controller.dart';

class ScreenProfileView extends GetView<ScreenProfileController> {
  ScreenProfileView(
      {this.currentUseruid = "Something error", Key? key, this.data})
      : super(key: key);

  final data;
  final String currentUseruid;

  final profileController = Get.put(ScreenProfileController());

  @override
  Widget build(BuildContext context) {
    final String profileUID = data["id"];
    print(profileUID);
    print(currentUseruid);
    return Scaffold(
        backgroundColor: scaffoldBG,
        appBar: AppBar(
          backgroundColor: scaffoldBG,
          elevation: 0.0,
          actions: [
            Visibility(
              visible: profileUID == currentUseruid ? true : false,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                    ElevatedButton(onPressed: () {
                      Get.to(ScreenUpdateView(data: data,));
                    }, child: const Text("Edit")),
              ),
            ),
          ],
          leading: IconButton(
              onPressed: () => Get.offAll(() => HomeView(),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(seconds: 1)),
              icon: Icon(
                Icons.clear_outlined,
                size: 40,
                color: blue,
              )),
        ),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 100.0, 16, 0.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: white,
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.cover,
                            image: MemoryImage(const Base64Decoder()
                                .convert(data['stringImg'])),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Column(
                    children: [
                      ProfileTiles(
                        icon: Icons.account_circle_outlined,
                        iconColor: blue,
                        title: data['name'],
                        titleType: "Name",
                      ),
                      ProfileTiles(
                        icon: Icons.work,
                        iconColor: Colors.pink,
                        title: data['job'],
                        titleType: "Job",
                      ),
                      ProfileTiles(
                        icon: Icons.phone_android_rounded,
                        iconColor: Colors.green,
                        title: data['number'],
                        titleType: "Phone",
                      ),
                      ProfileTiles(
                        icon: Icons.phone_android_rounded,
                        iconColor: Colors.yellow.shade400,
                        title: data['email'],
                        titleType: "Email",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
