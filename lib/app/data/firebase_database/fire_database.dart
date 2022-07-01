import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_example/app/data/firebase_database/user_data_model.dart';

class FirebaseDB {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection("Users");

  Future createUserData(UserModel userModel) async {
    return await profileList.doc(userModel.uid).set({
      "name": userModel.name,
      "job": userModel.job,
      "number": userModel.phone,
      "email": userModel.mail
    });
  }
}
