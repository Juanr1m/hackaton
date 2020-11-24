import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/models/offer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/body.dart';

class OfferDetailsScreen extends StatefulWidget {
  static String routeName = '/offer_details';
  OfferDetailsScreen({Key key}) : super(key: key);

  @override
  _OfferDetailsScreenState createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  bool _isInBookmarks = false;

  @override
  Widget build(BuildContext context) {
    final OfferDetailsArgument arguments =
        ModalRoute.of(context).settings.arguments;
    void _handleBookmark() {
      setState(() {
        arguments.offer.isBookmark = !arguments.offer.isBookmark;
      });
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: RaisedButton(
          onPressed: () {},
          color: kPrimaryColor,
          child: Text(
            'Откликнуться',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              arguments.offer.isBookmark
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              color: arguments.offer.isBookmark ? kPrimaryColor : Colors.black,
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
      body: Body(
        offer: arguments.offer,
      ),
    );
  }
}

class OfferDetailsArgument {
  final Offer offer;

  OfferDetailsArgument({@required this.offer});
}
