import 'dart:convert';

UserModel usersModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String usersModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel(
      {required this.email,
      required this.job,
      required this.name,
      required this.number,
      required this.imageString,
      required this.uid});

  String email;
  String job;
  String name;
  String number;
  String imageString;
  String uid;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        job: json["job"],
        name: json["name"],
        number: json["number"],
        uid: json["uid"],
        imageString: json["imageString"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "job": job,
        "name": name,
        "number": number,
      };
}
