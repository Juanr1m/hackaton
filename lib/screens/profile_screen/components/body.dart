import 'package:cactus_jobs/models/offer.dart';
import 'package:cactus_jobs/models/userModel.dart';
import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:cactus_jobs/screens/home_screen/components/popular_offers.dart';
import 'package:cactus_jobs/screens/offer_details/offer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final offers = Provider.of<List<Offer>>(context);
    final user = Provider.of<UserModel>(context);

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppName(
              firstTitle: 'Мой ',
              secondTitle: 'Профиль',
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: user.displayImage == null
                              ? AssetImage('assets/rick.jpg')
                              : NetworkImage(user.displayImage),
                          fit: BoxFit.fitHeight)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileField(
                      title: 'Имя',
                      item: user.fullName,
                    ),
                    ProfileField(
                      title: 'Email',
                      item: user.email,
                    ),
                    ProfileField(
                      title: 'Профессия',
                      item: user.profession == null ? '' : user.profession,
                    ),
                    ProfileField(
                      title: 'Город',
                      item: user.country == null ? '' : user.country,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Избранное:',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                ...List.generate(offers.length, (index) {
                  if (offers[index].isBookmark) {
                    return OfferCard(
                      offer: offers[index],
                      press: () => Navigator.pushNamed(
                        context,
                        OfferDetailsScreen.routeName,
                        arguments: OfferDetailsArgument(offer: offers[index]),
                      ),
                    );
                  }
                  return SizedBox(height: 1);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String title, item;
  const ProfileField({
    Key key,
    this.title,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$title:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(
              item,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
