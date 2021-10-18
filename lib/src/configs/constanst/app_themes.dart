import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

normalTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_FAMILY_ROBOTO,
    backgroundColor: BACKGROUND_COLOR_LIGHT,
    primarySwatch: Colors.blue,
    primaryColor: PRIMARY_COLOR_LIGHT,
    disabledColor: Colors.grey,
    cardColor: COLOR_LIGHT,
    canvasColor: Colors.white,
    bottomAppBarColor: COLOR_LIGHT,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    shadowColor: COLOR_GREY,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(),
      elevation: 0.0,
    ),
    colorScheme: Theme.of(context).colorScheme.copyWith(
        brightness: Brightness.light,
        secondary: COLOR_BLACK,
        onBackground: BACKGROUND_COLOR_LIGHT,
        onSurface: BACKGROUND_COLOR_DARK,
        background: BACKGROUND_COLOR_DARK,
        error: PRIMARY_COLOR_LIGHT,
        onError: PRIMARY_COLOR_LIGHT,
        onPrimary: COLOR_BLACK,
        onSecondary: COLOR_BLACK,
        primary: COLOR_BLACK,
        primaryVariant: PRIMARY_COLOR_LIGHT,
        secondaryVariant: PRIMARY_COLOR_LIGHT,
        surface: COLOR_BLACK),
  );
}

lightTheme(BuildContext context) {
  return ThemeData(
    fontFamily: FONT_FAMILY_ROBOTO,
    backgroundColor: BACKGROUND_COLOR_LIGHT,
    primarySwatch: Colors.blue,
    primaryColor: PRIMARY_COLOR_LIGHT,
    colorScheme: Theme.of(context).colorScheme.copyWith(
        brightness: Brightness.light,
        secondary: COLOR_BLACK,
        onBackground: BACKGROUND_COLOR_DARK,
        onSurface: BACKGROUND_COLOR_DARK,
        background: BACKGROUND_COLOR_DARK,
        error: PRIMARY_COLOR_LIGHT,
        onError: PRIMARY_COLOR_LIGHT,
        onPrimary: COLOR_BLACK,
        onSecondary: COLOR_BLACK,
        primary: COLOR_BLACK,
        primaryVariant: COLOR_BLACK,
        secondaryVariant: COLOR_BLACK,
        surface: COLOR_BLACK),
    disabledColor: Colors.grey,
    cardColor: COLOR_LIGHT,
    canvasColor: Colors.white,
    bottomAppBarColor: COLOR_LIGHT,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    shadowColor: COLOR_GREY,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(),
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
    colorScheme: Theme.of(context).colorScheme.copyWith(
        brightness: Brightness.light,
        secondary: COLOR_LIGHT,
        onBackground: BACKGROUND_COLOR_DARK,
        onSurface: BACKGROUND_COLOR_DARK,
        background: BACKGROUND_COLOR_DARK,
        error: PRIMARY_COLOR_LIGHT,
        onError: PRIMARY_COLOR_LIGHT,
        onPrimary: PRIMARY_COLOR_LIGHT,
        onSecondary: PRIMARY_COLOR_LIGHT,
        primary: PRIMARY_COLOR_LIGHT,
        primaryVariant: PRIMARY_COLOR_LIGHT,
        secondaryVariant: PRIMARY_COLOR_LIGHT,
        surface: PRIMARY_COLOR_LIGHT),
    disabledColor: Colors.grey,
    cardColor: COLOR_GREY,
    canvasColor: Colors.black,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomAppBarColor: COLOR_BLACK,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: ColorScheme.dark(),
          buttonColor: Colors.blue,
          splashColor: Colors.black,
        ),
    shadowColor: COLOR_LIGHT,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(),
      elevation: 0.0,
    ),
  );
}
