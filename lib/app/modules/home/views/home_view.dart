import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:firebase_auth_example/app/modules/screen_profile/views/screen_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  final String currentUser =
      FirebaseAuth.instance.currentUser!.email.toString();
  final String currentUserID =
      FirebaseAuth.instance.currentUser!.uid.toString();
  final Stream<QuerySnapshot> streamData =
      FirebaseFirestore.instance.collection("Users").snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: scaffoldBG,
            elevation: 0,
            centerTitle: true,
            title: Text("Signed in as $currentUser",
                style: TextStyle(
                    color: blue, fontWeight: FontWeight.bold, fontSize: 15)),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: black),
                    onPressed: () async =>
                        await FirebaseAuth.instance.signOut(),
                    icon: Icon(Icons.logout, color: blue),
                    label: const Text("Sign out")),
              ),
            ]),
        backgroundColor: scaffoldBG,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: streamData,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print("Something ERRRRRRRRRRRRRRRROR");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final List usersData = [];
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map a = document.data() as Map<String, dynamic>;
                  usersData.add(a);
                  a["id"] = document.id;
                }).toList();
                return ListView.builder(
                      itemCount: usersData.length,
                      itemBuilder: (context, index) {
                        final data = usersData[index];
                        return GestureDetector(
                          onTap: () => Get.to(ScreenProfileView(
                              data: data, currentUseruid: currentUserID)),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: black,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomLeft: Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: CircleAvatar(
                                              backgroundColor: white,
                                              radius: 30,
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25),
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: MemoryImage(
                                                      const Base64Decoder()
                                                          .convert(
                                                        usersData[index]
                                                            ["stringImg"],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            usersData[index]["name"].toString().toUpperCase(),
                                            style: TextStyle(
                                                color: white,
                                                fontSize: 18,
                                                fontWeight:FontWeight.bold)
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10)
                            ],
                          ),
                        );
                      },
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
