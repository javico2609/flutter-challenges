import 'package:playground_flutter/home.dart';
import 'package:playground_flutter/pages/navigation-bars/3d_bottom_navigation_bar.dart';
import 'package:playground_flutter/pages/navigation-bars/bottom_with_float_button.dart';

var routes = {
  '/': (context) => MyHomePage(),
  '/BottomBarWithFloatButton': (context) => BottomBarWithFloatButton(),
  '/ThreeDimenssionBottomNavigationBar': (context) =>
      new ThreeDimenssionBottomNavigationBar()
};
