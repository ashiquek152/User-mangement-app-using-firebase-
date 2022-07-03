import 'dart:convert';
import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
}