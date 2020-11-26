import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String email;
  String fullName;
  Timestamp accountCreated;

  UserModel({
    this.uid,
    this.email,
    this.fullName,
    this.accountCreated,
  });
}
