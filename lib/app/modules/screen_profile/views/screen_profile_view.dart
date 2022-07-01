import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/modules/home/views/home_view.dart';
import 'package:firebase_auth_example/app/modules/screen_profile/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/screen_profile_controller.dart';

class ScreenProfileView extends GetView<ScreenProfileController> {
  ScreenProfileView({Key? key}) : super(key: key);
  final profileController = Get.put(ScreenProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBG,
        appBar: AppBar(
            backgroundColor: scaffoldBG,
            // toolbarHeight: 2,
            elevation: 0.0,
            leading: IconButton(
                onPressed: () => Get.offAll(() => HomeView(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(seconds: 1)),
                icon:  Icon(
                  Icons.clear_outlined,
                  size: 40,
                  color: blue,
                ))),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 100.0, 16, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 40),
                      decoration: BoxDecoration(
                          color: red, borderRadius: BorderRadius.circular(80)),
                      height: 150,
                      width: 150,
                      child: const Center(child: Text("Image")),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ProfileTiles(
                        icon: profileController.profileIcons[index],
                        iconColor: profileController.iconColor[index],
                        title: profileController.profileItems[index],
                        titleType: profileController.titleType[index],
                      );
                    },
                  ),
                ),
              //   SizedBox(
              //     height: 50,
              //     width: MediaQuery.of(context).size.width,
              //     child: ElevatedButton(onPressed: (){}, child: const Text("Edit")))
              ],
            ),
          ),
        )));
  }
}
