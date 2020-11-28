import 'package:cactus_jobs/models/offer.dart';
import 'package:cactus_jobs/screens/offer_details/offer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class PopularOffers extends StatelessWidget {
  const PopularOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offers = Provider.of<List<Offer>>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Вакансии Дня',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 20),
        ...List.generate(offers.length, (index) {
          if (offers[index].isPopular) {
            return OfferCard(
              offer: offers[index],
              press: () => Navigator.pushNamed(
                  context, OfferDetailsScreen.routeName,
                  arguments: OfferDetailsArgument(offer: offers[index])),
            );
          }
          return SizedBox(height: 1);
        }),
      ],
    );
  }
}

class OfferCard extends StatelessWidget {
  final Offer offer;
  final GestureTapCallback press;
  const OfferCard({
    Key key,
    this.press,
    this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: 3,
                  color: offer.isBookmark ? kPrimaryColor : kSecondaryColor))),
      child: ListTile(
        title: Text(offer.title),
        subtitle: Text(offer.inCome.toString()),
        trailing: Container(
          width: 25,
          height: 25,
          child: Image.asset(offer.company),
        ),
        onTap: press,
      ),
    );
  }
}
