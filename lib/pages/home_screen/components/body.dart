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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppName(),
          SizedBox(height: 20),
          Container(
            child: Container(
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Найти Вакансию',
                    hintStyle: GoogleFonts.roboto(color: Colors.white),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
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
