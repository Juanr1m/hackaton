import 'package:cactus_jobs/screens/home_screen/components/popular_offers.dart';
import 'package:cactus_jobs/screens/home_screen/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
import 'category.dart';

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
            SizedBox(height: 20),
            PopularOffers()
          ],
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
