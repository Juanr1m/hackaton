import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/net/flutter_fire.dart';
import 'package:cactus_jobs/screens/home_screen/components/body.dart';
import 'package:cactus_jobs/screens/home_screen/home_screen.dart';
import 'package:cactus_jobs/screens/sign_up/sign_up.dart';
import 'package:cactus_jobs/state/sign_up_validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpValidation(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/05.png'),
            alignment: Alignment.bottomCenter,
          ),
        ),
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
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            SignInForm(),
          ],
        ),
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
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailField(
            emailField: _emailField,
            label: 'Email',
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          PasswordField(
            passwordField: _passwordField,
            label: 'Пароль',
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: kPrimaryColor,
                  onPressed: () async {
                    bool shouldNavigate =
                        await signIn(_emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.pushNamed(context, HomePage.routename);
                    }
                  },
                  child: Text(
                    'Войти',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: OutlineButton(
              splashColor: Colors.grey,
              onPressed: () async {
                bool shouldNavigate = await signInWithGoogle();
                if (shouldNavigate) {
                  Navigator.pushNamed(context, HomePage.routename);
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              highlightElevation: 0,
              borderSide: BorderSide(color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                        image: AssetImage("assets/google_logo.png"),
                        height: 25.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
    final validationService = Provider.of<SignUpValidation>(context);
    return TextFormField(
      controller: _passwordField,
      onChanged: (String value) {},
      decoration: InputDecoration(
        errorText: validationService.passwordField.error,
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
          borderSide: BorderSide(color: kPrimaryColor),
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
    final validationService = Provider.of<SignUpValidation>(context);
    return TextFormField(
      controller: _emailField,
      onChanged: (String value) {},
      decoration: InputDecoration(
          errorText: validationService.emailField.error,
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
            borderSide: BorderSide(color: kPrimaryColor),
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
