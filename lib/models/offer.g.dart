// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return Offer(
    json['id'] as String,
    json['company'] as String,
    json['title'] as String,
    json['desc'] as String,
    json['isBookmark'] as bool,
    json['isPopular'] as bool,
    json['inCome'] as int,
  );
}

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'company': instance.company,
      'inCome': instance.inCome,
      'isBookmark': instance.isBookmark,
      'isPopular': instance.isPopular,
    };
