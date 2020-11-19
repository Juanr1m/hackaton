import 'package:cactus_jobs/screens/offer_details/offer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            AppName(
              firstTitle: 'Cactus',
              secondTitle: 'Jobs',
            ),
            SizedBox(height: 20),
            SearchField(),
            SizedBox(height: 30),
            Category(),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Вакансии Дня',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 3, color: kSecondaryColor))),
                  child: ListTile(
                    title: Text('Frontend-разработчик'),
                    subtitle: Text('от 4.000.000 сум'),
                    trailing: Container(
                      width: 25,
                      height: 25,
                      child:
                          Image.asset('assets/1004px-Google__G__Logo.svg.png'),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OfferDetailsScreen()));
                    },
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    width: 3,
                    color: kSecondaryColor,
                  ))),
                  child: ListTile(
                    title: Text('UI-UX Дизайнер'),
                    subtitle: Text('от 4.000.000 сум'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OfferDetailsScreen()));
                    },
                    trailing: Container(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/123.png'),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    width: 3,
                    color: kSecondaryColor,
                  ))),
                  child: ListTile(
                    title: Text('Видео-монтажер'),
                    subtitle: Text('от 1.000.000 сум'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OfferDetailsScreen()));
                    },
                    trailing: Container(
                      width: 35,
                      height: 35,
                      child: Image.asset(
                          'assets/yandex+icon-1320194860721721271.png'),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                    width: 3,
                    color: kSecondaryColor,
                  ))),
                  child: ListTile(
                    title: Text('Курьер в Яндекс.еда'),
                    subtitle: Text('от 4.000.000 сум'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OfferDetailsScreen()));
                    },
                    trailing: Container(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/unnamed.png'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Популярные Категории',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryCard(
                imgAsset: 'assets/634e9d7041b25ff95cde40841733255f.jpg',
                title: 'Информационные \nТехнологии',
                press: () {},
              ),
              CategoryCard(
                imgAsset: 'assets/1d659093f0161d95d51fef52af38e160.jpg',
                title: 'Маркетинг',
                press: () {},
              ),
              CategoryCard(
                imgAsset: 'assets/Remote-Work-Dice.png',
                title: 'Удаленная Работа',
                press: () {},
              ),
              CategoryCard(
                imgAsset: 'assets/images.jpg',
                title: 'Неполный день',
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imgAsset;
  final String title;
  final GestureTapCallback press;
  const CategoryCard({
    Key key,
    this.imgAsset,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(),
              width: 250,
              height: 110,
              child: ColorFiltered(
                colorFilter:
                    ColorFilter.mode(Colors.black26, BlendMode.multiply),
                child: Image.asset(
                  imgAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [kPrimaryColor, kSecondaryColor]),
          borderRadius: BorderRadius.circular(25)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              hintText: 'Найти вакансию',
              hintStyle: GoogleFonts.montserrat(),
              suffixIcon: Icon(
                Icons.search,
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}

class AppName extends StatelessWidget {
  const AppName({
    Key key,
    this.firstTitle,
    this.secondTitle,
  }) : super(key: key);
  final String firstTitle, secondTitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstTitle,
        style: GoogleFonts.montserrat(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
        children: [
          TextSpan(
            text: secondTitle,
            style: GoogleFonts.montserrat(color: Colors.black),
          )
        ],
      ),
    );
  }
}
