import 'package:flutter/material.dart';
import 'package:admin/core/constants/color.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 25),
      backgroundColor: AppColor.primaryColor),
  fontFamily: "Lato",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(
      color: AppColor.grey,
      fontSize: 15,
      height: 2,
    ),
  ),
  primarySwatch: Colors.blue,
);
ThemeData themeArabic = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontFamily: "Lato", fontSize: 25),
      backgroundColor: AppColor.primaryColor),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(
      color: AppColor.grey,
      fontSize: 15,
      height: 2,
    ),
  ),
  primarySwatch: Colors.blue,
);
