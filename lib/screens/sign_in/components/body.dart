import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:cactus_jobs/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

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
            firstTitle: 'Cactus',
            secondTitle: 'Jobs',
          ),
          SizedBox(height: 10),
          Text(
            'Начать карьеру специалиста? Легко))',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          SignInForm(),
        ],
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Colors.black),
                  gapPadding: 10,
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.email_outlined)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: Colors.black),
                gapPadding: 10,
              ),
              labelText: 'Password',
              labelStyle: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              suffixIcon: Icon(Icons.lock_outline),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: RaisedButton(
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    'Войти',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
