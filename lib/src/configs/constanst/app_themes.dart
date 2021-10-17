import 'package:flutter/material.dart';

import 'constants.dart';

normalTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_FAMILY_ROBOTO,
    backgroundColor: BACKGROUND_COLOR_LIGHT,
    primarySwatch: Colors.blue,
    primaryColor: PRIMARY_COLOR_LIGHT,
    accentColor: COLOR_BLACK,
    disabledColor: Colors.grey,
    cardColor: COLOR_LIGHT,
    canvasColor: Colors.white,
    bottomAppBarColor: COLOR_LIGHT,
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    shadowColor: COLOR_GREY,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}

lightTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_FAMILY_ROBOTO,
    backgroundColor: BACKGROUND_COLOR_LIGHT,
    primarySwatch: Colors.blue,
    primaryColor: PRIMARY_COLOR_LIGHT,
    accentColor: COLOR_BLACK,
    disabledColor: Colors.grey,
    cardColor: COLOR_LIGHT,
    canvasColor: Colors.white,
    bottomAppBarColor: COLOR_LIGHT,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    shadowColor: COLOR_GREY,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}

darkTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_FAMILY_ROBOTO,
    backgroundColor: BACKGROUND_COLOR_DARK,
    primarySwatch: Colors.blue,
    primaryColor: PRIMARY_COLOR_DARK,
    accentColor: COLOR_LIGHT,
    disabledColor: Colors.grey,
    cardColor: COLOR_GREY,
    canvasColor: Colors.black,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.dark,
    bottomAppBarColor: COLOR_BLACK,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.dark(),
        buttonColor: Colors.blue,
        splashColor: Colors.black),
    shadowColor: COLOR_LIGHT,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}
