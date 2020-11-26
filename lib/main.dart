import 'package:cactus_jobs/routes.dart';
import 'package:cactus_jobs/screens/home_screen/home_screen.dart';
import 'package:cactus_jobs/screens/sign_in/sign_in.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cactus Jobs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentIconTheme: IconThemeData(color: kPrimaryColor),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
