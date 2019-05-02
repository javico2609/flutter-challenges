import 'package:flutter/material.dart';

enum Themes { light, dark, whapsapp }

ThemeData getThemeByType(Themes type) {
  switch (type) {
    case Themes.dark:
      return ThemeData.dark();
    case Themes.whapsapp:
      return ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
        canvasColor: Colors.transparent,
      );
    default:
      ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
      );
  }
}
