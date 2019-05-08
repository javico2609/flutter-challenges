import 'package:flutter/material.dart';

class GameOrganizerModelModel {
  final String name;
  final String country;
  final String city;
  final String hour;
  final String date;
  final int playersWithYes;
  final int playersWithNo;
  final int playersWithMaybe;
  final Color color;
  final IconData icon;

  GameOrganizerModelModel({
    this.name,
    this.country,
    this.city,
    this.hour,
    this.date,
    this.playersWithYes,
    this.playersWithNo,
    this.playersWithMaybe,
    this.color,
    this.icon,
  });
}
