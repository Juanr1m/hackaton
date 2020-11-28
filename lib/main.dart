import 'package:cactus_jobs/models/offer.dart';

import 'package:cactus_jobs/routes.dart';
import 'package:cactus_jobs/screens/home_screen/home_screen.dart';

import 'package:cactus_jobs/screens/sign_in/sign_in.dart';
import 'package:cactus_jobs/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Offer>>(
          create: (_) => streamOfOffers(),
          initialData: [],
        )
      ],
      child: MaterialApp(
        title: 'Cactus Jobs',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: HomePage.routename,
        routes: routes,
      ),
    );
  }

  Stream<List<Offer>> streamOfOffers() {
    var ref = FirebaseFirestore.instance.collection('offers');
    return ref.snapshots().map(
        (list) => list.docs.map((doc) => Offer.fromFirestore(doc)).toList());
  }
}
