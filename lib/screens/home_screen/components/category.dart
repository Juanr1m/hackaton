import 'package:cactus_jobs/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({
    Key key,
  }) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  ScrollController _controller;
  double _width = 30;
  double _scrollListener() {
    setState(() {
      _width = _controller.position.pixels;
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

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
          controller: _controller,
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
        SizedBox(height: 20),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 3,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 3,
              width: _width / 1.9,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
            )
          ],
        )
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
