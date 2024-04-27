import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColor.black,
  cardColor: AppColor.black,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)))),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.black,
    foregroundColor: AppColor.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: 25,
        color: AppColor.primaryColor,
        fontFamily: "Cairo",
        fontWeight: FontWeight.bold),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.black,
        statusBarIconBrightness: Brightness.light),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
        fontFamily: "Cairo"),
    displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
        fontFamily: "Cairo"),
    bodyLarge: TextStyle(
        height: 2, color: AppColor.white, fontSize: 14, fontFamily: "Cairo"),
    bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
        fontFamily: "Cairo",
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  useMaterial3: true,
  cardColor: AppColor.black,
  scaffoldBackgroundColor: AppColor.black,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)))),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColor.black,
    foregroundColor: AppColor.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontSize: 25, color: AppColor.primaryColor, fontFamily: "Cairo"),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.black,
        statusBarIconBrightness: Brightness.light),
  ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
        fontFamily: "Cairo"),
    displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
        fontFamily: "Cairo"),
    bodyLarge: TextStyle(
        height: 2, color: AppColor.white, fontSize: 14, fontFamily: "Cairo"),
    bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
        fontSize: 14,
        fontFamily: "Cairo"),
  ),
  primarySwatch: Colors.blue,
);
