import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF4D8802);

const kSecondaryColor = Color(0xFFFFD600);
const kTextColor = Color(0xFF757575);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: kTextColor),
  );
}
