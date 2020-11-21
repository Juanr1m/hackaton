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
        Container(
          decoration: BoxDecoration(
              border:
                  Border(left: BorderSide(width: 3, color: kSecondaryColor))),
          child: ListTile(
            title: Text('Frontend-разработчик'),
            subtitle: Text('от 4.000.000 сум'),
            trailing: Container(
              width: 25,
              height: 25,
              child: Image.asset('assets/1004px-Google__G__Logo.svg.png'),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => OfferDetailsScreen()));
            },
          ),
        ),
        Divider(
          color: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
            width: 3,
            color: kSecondaryColor,
          ))),
          child: ListTile(
            title: Text('UI-UX Дизайнер'),
            subtitle: Text('от 4.000.000 сум'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => OfferDetailsScreen()));
            },
            trailing: Container(
              width: 35,
              height: 35,
              child: Image.asset('assets/123.png'),
            ),
          ),
        ),
        Divider(
          color: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
            width: 3,
            color: kSecondaryColor,
          ))),
          child: ListTile(
            title: Text('Видео-монтажер'),
            subtitle: Text('от 1.000.000 сум'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => OfferDetailsScreen()));
            },
            trailing: Container(
              width: 35,
              height: 35,
              child: Image.asset('assets/yandex+icon-1320194860721721271.png'),
            ),
          ),
        ),
        Divider(
          color: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
            width: 3,
            color: kSecondaryColor,
          ))),
          child: ListTile(
            title: Text('Курьер в Яндекс.еда'),
            subtitle: Text('от 4.000.000 сум'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => OfferDetailsScreen()));
            },
            trailing: Container(
              width: 35,
              height: 35,
              child: Image.asset('assets/unnamed.png'),
            ),
          ),
        ),
      ],
    );
  }
}
