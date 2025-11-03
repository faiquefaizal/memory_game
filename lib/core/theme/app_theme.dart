import 'package:flutter/material.dart';
import 'package:memory_game/theme/app_color.dart';

final ThemeData appTheme = ThemeData(
  dialogTheme: DialogThemeData(backgroundColor: AppColor.scaffoldColor),
  primaryColor: AppColor.scaffoldColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    actionsPadding: EdgeInsets.all(5),
    backgroundColor: AppColor.scaffoldColor,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Spline Sans',
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'Spline Sans',
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: AppColor.primary,
      fontFamily: 'Spline Sans',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontFamily: 'Spline Sans',
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Spline Sans',
      fontSize: 16,
      color: Colors.grey,
    ),
  ),
  scaffoldBackgroundColor: AppColor.scaffoldColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      ),
      backgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.pressed)) {
          return Colors.blueGrey;
        }
        return AppColor.primary;
      }),
      foregroundColor: WidgetStatePropertyAll(AppColor.scaffoldColor),
    ),
  ),
);
