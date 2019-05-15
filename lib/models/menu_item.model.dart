import 'package:flutter/material.dart';

enum MenuItemType { TEMPLATE, COMPONENT, CODE }

class MenuModel {
  IconData icon;
  String title;
  String route;
  bool isRoot;
  MenuItemType type;

  MenuModel({
    this.title,
    this.icon,
    this.route,
    this.isRoot = false,
    this.type = MenuItemType.TEMPLATE,
  });
}
