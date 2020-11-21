import 'package:cactus_jobs/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/body.dart';

class OfferDetailsScreen extends StatefulWidget {
  OfferDetailsScreen({Key key}) : super(key: key);

  @override
  _OfferDetailsScreenState createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  bool _isInBookmarks = false;

  void _handleBookmark() {
    setState(() {
      _isInBookmarks = !_isInBookmarks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          width: 300,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Откликнуться',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),
            ),
          ),
        )
      ],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              _isInBookmarks ? Icons.bookmark : Icons.bookmark_border,
              color: _isInBookmarks ? kPrimaryColor : Colors.black,
            ),
            onPressed: _handleBookmark,
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(),
    );
  }
}
