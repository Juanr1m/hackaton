import 'package:cactus_jobs/models/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class OffersListScreen extends StatelessWidget {
  static String routeName = '/offer_list';
  const OffersListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OfferListArguments arguments =
        ModalRoute.of(context).settings.arguments;
    Stream<List<Offer>> streamOfFilteredOffers() {
      var ref = FirebaseFirestore.instance
          .collection('offers')
          .where('categories', arrayContainsAny: [arguments.id]);
      return ref.snapshots().map(
          (list) => list.docs.map((doc) => Offer.fromFirestore(doc)).toList());
    }

    return StreamProvider(
      create: (_) => streamOfFilteredOffers(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            arguments.title,
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
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
          bgAsset: arguments.bgAsset,
        ),
      ),
    );
  }
}

class OfferListArguments {
  final String id;
  final String title;
  final String bgAsset;

  OfferListArguments(this.id, this.title, this.bgAsset);
}
