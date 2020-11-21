import 'package:cactus_jobs/screens/offer_details/offer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class PopularOffers extends StatelessWidget {
  const PopularOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        OfferCard(
          title: 'Frontend-разработчик',
          imgAsset: 'assets/1004px-Google__G__Logo.svg.png',
          inCome: 'от 4.000.000 сум',
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OfferDetailsScreen()));
          },
        ),
        OfferCard(
          title: 'UI-UX Дизайнер',
          imgAsset: 'assets/123.png',
          inCome: 'от 4.000.000 сум',
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OfferDetailsScreen()));
          },
        ),
        OfferCard(
          title: 'Видео-монтажер',
          imgAsset: 'assets/yandex+icon-1320194860721721271.png',
          inCome: 'от 1.000.000 сум',
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OfferDetailsScreen()));
          },
        ),
        OfferCard(
          title: 'Курьер в Яндекс.еда',
          imgAsset: 'assets/unnamed.png',
          inCome: 'от 4.000.000 сум',
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OfferDetailsScreen()));
          },
        ),
      ],
    );
  }
}

class OfferCard extends StatelessWidget {
  final String title;
  final String imgAsset;
  final String inCome;
  final GestureTapCallback press;
  const OfferCard({
    Key key,
    this.title,
    this.imgAsset,
    this.inCome,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(left: BorderSide(width: 3, color: kSecondaryColor))),
      child: ListTile(
        title: Text(title),
        subtitle: Text(inCome),
        trailing: Container(
          width: 25,
          height: 25,
          child: Image.asset(imgAsset),
        ),
        onTap: press,
      ),
    );
  }
}
