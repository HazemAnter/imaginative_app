import 'package:flutter/material.dart';

import 'colors/colors.dart';

ThemeData lightTheme = ThemeData(
  tabBarTheme: TabBarTheme(
    labelPadding: EdgeInsets.symmetric(vertical: 8),
      labelStyle: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  )),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white,),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[400]),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
          padding: EdgeInsets.zero, primary: primaryColor)),
  primarySwatch: primaryColor,
);
