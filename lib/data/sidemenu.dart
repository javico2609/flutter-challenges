import 'package:flutter/material.dart';

class MenuModel {
  IconData icon;
  String title;
  String route;

  MenuModel(this.title, this.icon, this.route);
}

List<MenuModel> menu = [
  new MenuModel(
      'BottomTBar with FloatButton', Icons.menu, '/BottomBarWithFloatButton'),
  new MenuModel('3D BottomNavigationBar', Icons.bubble_chart,
      '/ThreeDimenssionBottomNavigationBar'),
  new MenuModel('Trending template', Icons.important_devices, '/Trending')
];
