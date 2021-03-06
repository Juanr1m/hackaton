import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/models/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class OfferDetailsScreen extends StatefulWidget {
  static String routeName = '/offer_details';
  OfferDetailsScreen({Key key}) : super(key: key);

  @override
  _OfferDetailsScreenState createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final OfferDetailsArgument arguments =
        ModalRoute.of(context).settings.arguments;
    void _handleBookmark() async {
      setState(() {
        arguments.offer.isBookmark = !arguments.offer.isBookmark;
      });
      if (arguments.offer.isBookmark) {
        await FirebaseFirestore.instance
            .collection('offers')
            .doc(arguments.offer.id)
            .update({'isBookmark': true});
      } else {
        await FirebaseFirestore.instance
            .collection('offers')
            .doc(arguments.offer.id)
            .update({'isBookmark': false});
      }
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
