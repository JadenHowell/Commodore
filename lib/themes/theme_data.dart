import 'package:flutter/material.dart';

import 'color_values.dart';

class CustomTheme{
  static ThemeData get theme => ThemeData(
    primaryColor: ColorValues.primaryColor,
    scaffoldBackgroundColor: ColorValues.backgroundColor,
    primaryColorDark: ColorValues.darkPrimaryColor,
    primaryColorLight: ColorValues.lightPrimaryColor,
    bottomAppBarColor: ColorValues.primaryColor,

    appBarTheme: AppBarTheme(
      backgroundColor: ColorValues.primaryColor,
      shadowColor: ColorValues.darkPrimaryColor,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorValues.buttonColor,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)){
              return ColorValues.buttonColor.withOpacity(0.5);
            }
            return ColorValues.buttonColor;
          },
        ),
      ),
    ),
  );

}