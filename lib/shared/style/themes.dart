import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: const Color(0xFF454545),
  bottomNavigationBarTheme: const  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.black12,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.deepOrangeAccent,
      size: 18,
    ),
    iconTheme: IconThemeData(
      color: Colors.deepOrange,
      size: 18,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),

    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      statusBarIconBrightness: Brightness.light,
    ),
    color: Colors.black12,
    elevation: 0,
  ),
  textTheme:const  TextTheme(
    headline1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      height: .8,
    ),
    bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.3),
    bodyText2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    overline: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  cardColor: const Color(0xFF000000),
  cardTheme:const  CardTheme(
      elevation: 7,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      )),
  dividerColor: const Color(0xFF999999),
  iconTheme:const  IconThemeData(
    color: Color(0xFFFFFFFF),
  ),
);

ThemeData lightTheme = ThemeData(
  iconTheme: const
  IconThemeData(
    color: Colors.grey,
  ),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.deepOrangeAccent,
      size: 18,
    ),
    iconTheme: IconThemeData(
      color: Colors.deepOrangeAccent,
      size: 18,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: Colors.white,
    elevation: 0,
  ),
  bottomNavigationBarTheme:const  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    button: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      height: .8,
    ),
    bodyText1: TextStyle(
      height: 1.3,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    overline: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
  cardColor: const Color(0xFFFFFFFF),
  cardTheme: const CardTheme(
      elevation: 7,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      )),
  dividerColor:const  Color(0xFFD5D8DC),
);
