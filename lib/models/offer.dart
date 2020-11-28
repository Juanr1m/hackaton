import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
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

// List<Offer> demoOffers = [
//   Offer(
//     title: 'Frontend-разработчик',
//     inCome: 4000000,
//     desc:
//         'Привет! Мы ищем классного стажера-разработчика.\nМы автоматизируем бизнес-процессы крупных заказчиков, создавая удобные и выверенные сервисы. \nВ работе множество сложных, в том числе высоконагруженных, проектов, широкий спектр интересных задач. \nСейчас мы ищем Стажера Frontend - разработчик (Vue.js/Nuxt) в наш офис в центре Москвы. \nМы готовы рассмотреть кандидатов без опыта. Трудоустройство по результатом выполненного тестового задания. \nОсновные технологии проекта: Vue.js, Nuxt.  ',
//     company: 'assets/1004px-Google__G__Logo.svg.png',
//   ),
//   Offer(
//     inCome: 4000000,
//     company: 'assets/123.png',
//     title: 'UI-UX Дизайнер',
//     desc: 'apple',
//   ),
//   Offer(
//     inCome: 1000000,
//     company: 'assets/yandex+icon-1320194860721721271.png',
//     title: 'Видео-монтажер',
//     desc: 'yand',
//     isBookmark: true,
//   ),
//   Offer(
//     company: 'assets/unnamed.png',
//     title: 'Курьер в Яндекс.еда',
//     desc: 'eda',
//     inCome: 4000000,
//   )
// ];
