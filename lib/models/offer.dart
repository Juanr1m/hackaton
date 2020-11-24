import 'package:flutter/widgets.dart';

class Offer {
  final String title;
  final String desc;
  final String company;
  final int inCome;
  final bool isBookmark;
  Offer({
    @required this.company,
    @required this.title,
    @required this.desc,
    this.isBookmark = false,
    this.inCome,
  });
}

List<Offer> demoOffers = [
  Offer(
    title: 'Frontend-разработчик',
    inCome: 4000000,
    desc:
        'Привет! Мы ищем классного стажера-разработчика.\nМы автоматизируем бизнес-процессы крупных заказчиков, создавая удобные и выверенные сервисы. \nВ работе множество сложных, в том числе высоконагруженных, проектов, широкий спектр интересных задач. \nСейчас мы ищем Стажера Frontend - разработчик (Vue.js/Nuxt) в наш офис в центре Москвы. \nМы готовы рассмотреть кандидатов без опыта. Трудоустройство по результатом выполненного тестового задания. \nОсновные технологии проекта: Vue.js, Nuxt.  ',
    company: 'assets/1004px-Google__G__Logo.svg.png',
  ),
  Offer(
    inCome: 4000000,
    company: 'assets/123.png',
    title: 'UI-UX Дизайнер',
    desc: 'apple',
  ),
  Offer(
    inCome: 1000000,
    company: 'assets/yandex+icon-1320194860721721271.png',
    title: 'Видео-монтажер',
    desc: 'yand',
    isBookmark: true,
  ),
  Offer(
    company: 'assets/unnamed.png',
    title: 'Курьер в Яндекс.еда',
    desc: 'eda',
    inCome: 4000000,
  )
];
