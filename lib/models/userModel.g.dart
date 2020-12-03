// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    uid: json['uid'] as String,
    email: json['email'] as String,
    fullName: json['fullName'] as String,
    displayImage: json['displayImage'] as String,
    country: json['country'] as String,
    profession: json['profession'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'fullName': instance.fullName,
      'displayImage': instance.displayImage,
      'country': instance.country,
      'profession': instance.profession,
    };
