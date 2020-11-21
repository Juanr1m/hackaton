import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Frontend-разработчик',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'От ',
                        style: GoogleFonts.montserrat(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        children: [
                          TextSpan(
                              text: '4.000.000 сум.',
                              style:
                                  GoogleFonts.montserrat(color: Colors.black))
                        ]),
                  ),
                ],
              ),
              Container(
                child: Image.asset('assets/1004px-Google__G__Logo.svg.png'),
                width: 50,
                height: 50,
              )
            ],
          ),
          SizedBox(height: 15),
          SizedBox(height: 15),
          Text(
            'Описание:',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text('asd', style: TextStyle(color: Colors.black87, fontSize: 16)),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    child: Image.asset('assets/1004px-Google__G__Logo.svg.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Google inc.'),
                      Text('г. Калифорния'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
