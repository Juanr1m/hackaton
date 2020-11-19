import 'package:cactus_jobs/constants.dart';
import 'package:flutter/material.dart';

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
