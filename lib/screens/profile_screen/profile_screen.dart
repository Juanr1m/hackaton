import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/rick.jpg'),
                        fit: BoxFit.fitHeight)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileField(
                    title: 'Имя',
                    item: 'Ваня Иванов',
                  ),
                  ProfileField(
                    title: 'Email',
                    item: 'employer@gmail.com',
                  ),
                  ProfileField(
                    title: 'Профессия',
                    item: 'Go Developer',
                  ),
                  ProfileField(
                    title: 'Город',
                    item: 'Фергана',
                  ),
                ],
              ),
            ],
          )
        ],
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
