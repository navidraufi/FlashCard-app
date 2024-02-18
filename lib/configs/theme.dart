import 'package:flutter/material.dart';
import 'package:message_app/configs/constants.dart';

final appTheme = ThemeData(
    fontFamily: "Nunito",
    primaryColor: kPrimaryColor,
    cardColor: kSecondaryColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 8, 8, 15),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: kPrimaryColor,
      iconTheme: IconThemeData(color: kWhiteColor),
      titleTextStyle: TextStyle(
          letterSpacing: 2.0,
          fontFamily: "Nunito",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: kWhiteColor),
    ),
    scaffoldBackgroundColor: kWhiteColor);
