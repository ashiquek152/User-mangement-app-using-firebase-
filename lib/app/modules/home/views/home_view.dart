import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/modules/screen_profile/views/screen_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBG,
        appBar: AppBar(
          // toolbarHeight: 1,
          backgroundColor: scaffoldBG,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: ()async => await firebaseAuth.signOut(),
                icon: const Icon(Icons.logout))
          ],
          title: const Text('Homescreen'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListTile(
                         onTap: ()=>Get.to(()=> ScreenProfileView(),transition: Transition.cupertinoDialog,duration: const Duration(seconds: 1)),
                        tileColor: red,
                        title: Text("data ${index + 1}"),
                        leading:  const CircleAvatar(
                          backgroundImage:AssetImage("assets/sample2.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
