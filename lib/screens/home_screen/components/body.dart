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
            AppName(),
            SizedBox(height: 20),
            SearchField(),
            SizedBox(height: 30),
            Category(),
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
          'Популярные Направления',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 15),
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: 250,
              height: 110,
              child: Image.asset(
                imgAsset,
                fit: BoxFit.cover,
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
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Cactus',
        style: GoogleFonts.montserrat(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
        children: [
          TextSpan(
            text: 'Jobs',
            style: GoogleFonts.montserrat(color: Colors.black),
          )
        ],
      ),
    );
  }
}
