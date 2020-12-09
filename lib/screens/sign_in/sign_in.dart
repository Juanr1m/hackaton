import 'package:cactus_jobs/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Body(),
      );
    }
    return HomePage();
  }
}
