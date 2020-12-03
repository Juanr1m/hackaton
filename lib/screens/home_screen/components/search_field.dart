import 'package:cactus_jobs/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

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
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SearchScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07),
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Найти вакансию',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
