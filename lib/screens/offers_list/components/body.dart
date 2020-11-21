import 'package:cactus_jobs/screens/home_screen/components/popular_offers.dart';
import 'package:cactus_jobs/screens/offer_details/offer_details_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            OfferCard(
              title: 'Frontend-разработчик',
              imgAsset: 'assets/1004px-Google__G__Logo.svg.png',
              inCome: 'от 4.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            OfferCard(
              title: 'UI-UX Дизайнер',
              imgAsset: 'assets/123.png',
              inCome: 'от 4.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            OfferCard(
              title: 'Видео-монтажер',
              imgAsset: 'assets/yandex+icon-1320194860721721271.png',
              inCome: 'от 1.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            OfferCard(
              title: 'Курьер в Яндекс.еда',
              imgAsset: 'assets/unnamed.png',
              inCome: 'от 4.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
            OfferCard(
              title: 'Frontend-разработчик',
              imgAsset: 'assets/1004px-Google__G__Logo.svg.png',
              inCome: 'от 4.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            OfferCard(
              title: 'UI-UX Дизайнер',
              imgAsset: 'assets/123.png',
              inCome: 'от 4.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            OfferCard(
              title: 'Видео-монтажер',
              imgAsset: 'assets/yandex+icon-1320194860721721271.png',
              inCome: 'от 1.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
            Divider(
              color: Colors.transparent,
            ),
            OfferCard(
              title: 'Курьер в Яндекс.еда',
              imgAsset: 'assets/unnamed.png',
              inCome: 'от 4.000.000 сум',
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OfferDetailsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
