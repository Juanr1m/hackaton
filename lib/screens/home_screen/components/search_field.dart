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
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: MediaQuery.of(context).size.width / 38),
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
