import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/net/flutter_fire.dart';
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/01.png'),
          alignment: Alignment.bottomCenter,
        ),
      ),
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
            'Регистрация',
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
  final List<String> errors = [];
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _fullNameField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameField(
            fullNameField: _fullNameField,
            label: 'Имя',
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          EmailField(
            emailField: _emailField,
            label: 'Email',
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          PasswordField(
            passwordField: _passwordField,
            label: 'Password',
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: RaisedButton(
                color: kPrimaryColor,
                onPressed: () async {
                  bool shouldNavigate = await register(_emailField.text,
                      _passwordField.text, _fullNameField.text);
                  if (shouldNavigate) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  }
                },
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NameField extends StatelessWidget {
  const NameField({
    Key key,
    @required TextEditingController fullNameField,
    this.label,
  })  : _fullNameField = fullNameField,
        super(key: key);

  final TextEditingController _fullNameField;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _fullNameField,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.black),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          hintText: 'Ваня Иванов',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key key,
    @required TextEditingController passwordField,
    this.label,
  })  : _passwordField = passwordField,
        super(key: key);

  final TextEditingController _passwordField;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String value) {},
      controller: _passwordField,
      decoration: InputDecoration(
        focusColor: kPrimaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.black),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kPrimaryColor),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        suffixIcon: Icon(Icons.lock_outline),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    Key key,
    @required TextEditingController emailField,
    this.label,
  })  : _emailField = emailField,
        super(key: key);

  final TextEditingController _emailField;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailField,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.black),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: kPrimaryColor),
            gapPadding: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          hintText: 'employer@gmail.com',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }
}
