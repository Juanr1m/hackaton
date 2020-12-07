import 'package:cactus_jobs/screens/home_screen/components/popular_offers.dart';
import 'package:cactus_jobs/screens/home_screen/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
import 'category.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppName(
              firstTitle: 'Cactus',
              secondTitle: 'Jobs',
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            SearchField(),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            Category(),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
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
