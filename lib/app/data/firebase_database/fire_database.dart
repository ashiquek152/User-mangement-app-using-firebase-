import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_example/app/data/firebase_database/user_data_model.dart';

class FirebaseDB {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection("Users");

  Future createUserData(UserModel userModel) async {
    return await profileList.doc(userModel.uid).set({
      "name": userModel.name,
      "job": userModel.job,
      "number": userModel.number,
      "email": userModel.email,
      "stringImg":userModel.imageString
    });
  }

  Future getUserData() async {
    List usersList = [];
     try {
      await profileList.get().then((snapshotData) {for (var element in snapshotData.docs) {
          usersList.add(element);        
      }});
            return usersList;
     } catch (e) {
      print(e.toString());
      return null;
     }
  }
  Future updateUserData(UserModel userModel) async {
    return await profileList.doc(userModel.uid).update({
      "name": userModel.name,
      "job": userModel.job,
      "number": userModel.number,
      "email": userModel.email,
      "stringImg":userModel.imageString
    });
  }
}
