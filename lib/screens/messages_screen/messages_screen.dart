import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({Key key}) : super(key: key);

  @override
  _MessagesScreen createState() => _MessagesScreen();
}

class _MessagesScreen extends State<MessagesScreen> {
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
            firstTitle: 'Сообщения',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.question_answer_rounded,
                  color: Colors.grey,
                  size: 150,
                ),
                Text(
                  'Нет Сообщений',
                  style: GoogleFonts.montserrat(fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
