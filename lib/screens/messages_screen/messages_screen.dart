import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  static String routeName = '/messages';
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
            height: MediaQuery.of(context).size.height / 6,
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
                  'Здесь будут ваши\nсообщения',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4.9,
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
