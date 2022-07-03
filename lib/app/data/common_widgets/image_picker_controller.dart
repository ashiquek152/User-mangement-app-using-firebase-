import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth_example/app/data/common_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';




class ImageController extends GetxController {
  File? image;
  String stringOfimg = '';

  pickGalleryImage() async {
    final galleryImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (galleryImage == null) {
      return;
    } else {
      image = File(galleryImage.path);
      update();
      final bytes = File(galleryImage.path).readAsBytesSync();
      stringOfimg = base64Encode(bytes);
      update();
    }
  }
  pickCameraImage() async {
    final galleryImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (galleryImage == null) {
      return;
    } else {
      image = File(galleryImage.path);
      update();
      final bytes = File(galleryImage.path).readAsBytesSync();
      stringOfimg = base64Encode(bytes);
      update();
    }
  }
  bottomSheet() async {
    await Get.bottomSheet(
      BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 150,
              color: scaffoldBG,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: ()async {
                               await pickCameraImage();
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: 35,
                              color: blue,
                            )),
                            const Text("Camera")
                      ],
                    ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                            onPressed: () async{
                               await pickGalleryImage();
                            },
                            icon: Icon(
                              Icons.image_search_sharp,
                              size: 35,
                              color: blue,
                            )),
                            const Text("Gallery")
                          ],
                        )
                  ],
                ),
              ),
            );
          }),
    );
  }
}