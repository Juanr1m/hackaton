import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  String uid;
  String email;

  String fullName;
  String displayImage;
  String country;
  String profession;

  UserModel({
    this.uid,
    this.email,
    this.fullName,
    this.displayImage,
    this.country,
    this.profession,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    UserModel userModel = UserModel.fromJson(documentSnapshot.data());
    userModel.uid = documentSnapshot.id;
    return userModel;
  }
}

Future<String> getCurrentUser() async {
  final User user = FirebaseAuth.instance.currentUser;
  final String uid = user.uid.toString();
  return uid;
}
