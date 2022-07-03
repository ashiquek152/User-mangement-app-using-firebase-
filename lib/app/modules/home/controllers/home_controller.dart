import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_example/app/data/firebase_database/fire_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // final count = 0.obs;
  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
  List userData = [];

  final user = FirebaseAuth.instance.currentUser;
  

  fetchItems() async {
    dynamic results = await FirebaseDB().getUserData();
    if (results != null) {
      userData = results;
    } else {
      print("Unable to fetch");
    }
    return userData;
  }
}
