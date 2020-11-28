import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: kPrimaryColor,
      accentIconTheme: IconThemeData(color: kPrimaryColor),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ));
}