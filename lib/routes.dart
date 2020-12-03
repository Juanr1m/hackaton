import 'package:cactus_jobs/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:cactus_jobs/screens/home_screen/home_screen.dart';
import 'package:cactus_jobs/screens/messages_screen/messages_screen.dart';
import 'package:cactus_jobs/screens/offer_details/offer_details_screen.dart';
import 'package:cactus_jobs/screens/offers_list/offers_list_screen.dart';
import 'package:cactus_jobs/screens/profile_screen/profile_screen.dart';
import 'package:cactus_jobs/screens/search_screen/search_screen.dart';
import 'package:cactus_jobs/screens/sign_in/sign_in.dart';
import 'package:cactus_jobs/screens/sign_up/sign_up.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routename: (context) => HomePage(),
  MessagesScreen.routeName: (context) => MessagesScreen(),
  OfferDetailsScreen.routeName: (context) => OfferDetailsScreen(),
  OffersListScreen.routeName: (context) => OffersListScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
};
