import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Frontend-разработчик',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'От ',
                          style: GoogleFonts.montserrat(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          children: [
                            TextSpan(
                                text: '4.000.000 сум.',
                                style:
                                    GoogleFonts.montserrat(color: Colors.black))
                          ]),
                    ),
                  ],
                ),
                Container(
                  child: Image.asset('assets/1004px-Google__G__Logo.svg.png'),
                  width: 50,
                  height: 50,
                )
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Описание:',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                'Привет! Мы ищем классного стажера-разработчика.\nМы автоматизируем бизнес-процессы крупных заказчиков, создавая удобные и выверенные сервисы. \nВ работе множество сложных, в том числе высоконагруженных, проектов, широкий спектр интересных задач. \nСейчас мы ищем Стажера Frontend - разработчик (Vue.js/Nuxt) в наш офис в центре Москвы. \nМы готовы рассмотреть кандидатов без опыта. Трудоустройство по результатом выполненного тестового задания. \nОсновные технологии проекта: Vue.js, Nuxt.  ',
                style: TextStyle(color: Colors.black87, fontSize: 16)),
            SizedBox(height: 25),
            Text(
              'Бонусы:',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('- участие в динамично растущей компании;',
                    style: TextStyle(color: Colors.black87, fontSize: 16)),
                Text(
                    '- широкие возможности роста: проектов очень много, чем лучше справляетесь – тем больше интересных задач и ответственности;',
                    style: TextStyle(color: Colors.black87, fontSize: 16)),
                Text('- интересные и нетривиальные задачи, отсутствие рутины;',
                    style: TextStyle(color: Colors.black87, fontSize: 16)),
                Text(
                    '- график работы – с 11 до 20 часов, минимум 6 часов в офисе;',
                    style: TextStyle(color: Colors.black87, fontSize: 16)),
                Text(
                    '- Профессиональный рост и участие в построении архитектур сложных систем',
                    style: TextStyle(color: Colors.black87, fontSize: 16)),
              ],
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      child:
                          Image.asset('assets/1004px-Google__G__Logo.svg.png'),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Google inc.',
                            style: GoogleFonts.montserrat(fontSize: 16)),
                        Text('г. Калифорния',
                            style: GoogleFonts.montserrat(fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
