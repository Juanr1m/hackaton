import 'package:cactus_jobs/models/offer.dart';
import 'package:cactus_jobs/screens/home_screen/components/popular_offers.dart';
import 'package:cactus_jobs/screens/offer_details/offer_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final String bgAsset;
  const Body({Key key, this.bgAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offers = Provider.of<List<Offer>>(context);
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(bgAsset),
            ),
            ...List.generate(
              offers.length,
              (index) => OfferCard(
                offer: offers[index],
                press: () {
                  Navigator.pushNamed(
                    context,
                    OfferDetailsScreen.routeName,
                    arguments: OfferDetailsArgument(offer: offers[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
