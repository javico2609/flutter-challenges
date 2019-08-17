import 'package:flutter/material.dart';

enum Themes {
  light,
  dark,
  whapsapp,
  gameOrganizer,
  smartHome,
  networkGas,
  sliverProfile,
  stayfit,
  calculator
}

ThemeData getThemeByType(Themes type) {
  switch (type) {
    case Themes.dark:
      return ThemeData(
        brightness: Brightness.light,
      );
    case Themes.whapsapp:
      return ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
        fontFamily: 'Rubik',
      );
    case Themes.smartHome:
      return ThemeData(
        brightness: Brightness.light,
        backgroundColor: Color(0xfff7f8f9),
        fontFamily: 'Rubik',
        cardColor: Colors.white,
        accentColor: Color(0xffff1e39),
        //textTheme: TextTheme(),
      );
    case Themes.gameOrganizer:
      return ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: new Color(0xff00b965),
        ),
        accentColor: new Color(0xff00b965),
        backgroundColor: Color(0xfff7f8f9),
        fontFamily: 'Rubik',
        cardColor: Colors.white,
        //textTheme: TextTheme(),
      );
    case Themes.networkGas:
      {
        return ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Roboto',
        );
      }
    case Themes.sliverProfile:
      {
        return ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(
              title: TextStyle(
            color: Colors.black,
          )),
          fontFamily: 'Roboto',
        );
      }
    case Themes.stayfit:
      {
        return ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Gotham',
        );
      }
    case Themes.calculator:
      return ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        backgroundColor: Color(0xff464c51),
        textTheme: TextTheme(
          body1: TextStyle(
            letterSpacing: 1.3,
          ),
        ),
      );
    default:
      return ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Rubik',
      );
  }
}

const Color _kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
const Color _kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
const Color _kAmbientShadowOpacity = Color(0x1F000000); // alpha = 0.12

List<BoxShadow> shadow1 = [
  BoxShadow(
    offset: Offset(0.0, 0.3),
    blurRadius: 0.3,
    spreadRadius: -0.3,
    color: _kKeyUmbraOpacity.withOpacity(0.5),
  ),
  BoxShadow(
    offset: Offset(0.0, 0.3),
    blurRadius: 0.3,
    spreadRadius: 0.0,
    color: _kKeyPenumbraOpacity.withOpacity(0.5),
  ),
  BoxShadow(
    offset: Offset(0.0, 0.3),
    blurRadius: 0.3,
    spreadRadius: 0.0,
    color: _kAmbientShadowOpacity.withOpacity(0.5),
  ),
];
