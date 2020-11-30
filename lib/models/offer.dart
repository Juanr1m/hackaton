import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer {
  String id;
  String title;
  String desc;
  String company;
  int inCome;
  bool isBookmark;
  bool isPopular;
  Offer(
    this.id,
    this.company,
    this.title,
    this.desc,
    this.isBookmark,
    this.isPopular,
    this.inCome,
  );

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<dynamic, dynamic> toJson() => _$OfferToJson(this);

  factory Offer.fromFirestore(DocumentSnapshot documentSnapshot) {
    Offer offer = Offer.fromJson(documentSnapshot.data());
    offer.id = documentSnapshot.id;
    return offer;
  }
}
