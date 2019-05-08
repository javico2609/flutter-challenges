import 'package:flutter/material.dart';
import 'package:playground_flutter/data/icons.dart';
import 'package:playground_flutter/models/game_organizer_model.dart';

final List<GameOrganizerModelModel> organizerTodayData = [
  new GameOrganizerModelModel(
    name: 'Tennis',
    city: 'New York',
    country: 'USA',
    date: 'April 1, 2019',
    hour: '12:30',
    playersWithMaybe: 4,
    playersWithNo: 2,
    playersWithYes: 8,
    color: Color(0xfffcb35f),
    icon: tennis,
  ),
];

final List<GameOrganizerModelModel> organizerOtherData = [
  new GameOrganizerModelModel(
    name: 'Golf',
    city: 'New York',
    country: 'USA',
    date: 'April 1, 2019',
    hour: '12:30',
    playersWithMaybe: 4,
    playersWithNo: 2,
    playersWithYes: 8,
    color: Color(0xff7872f8),
    icon: golf_field,
  ),
  new GameOrganizerModelModel(
    name: 'Football',
    city: 'New York',
    country: 'USA',
    date: 'April 1, 2019',
    hour: '12:30',
    playersWithMaybe: 4,
    playersWithNo: 2,
    playersWithYes: 8,
    color: Color(0xff2a8cee),
    icon: football,
  ),
  new GameOrganizerModelModel(
    name: 'Football A.',
    city: 'New York',
    country: 'USA',
    date: 'April 1, 2019',
    hour: '12:30',
    playersWithMaybe: 4,
    playersWithNo: 2,
    playersWithYes: 8,
    color: Colors.redAccent,
    icon: football_american,
  ),
  new GameOrganizerModelModel(
    name: 'Baseball',
    city: 'New York',
    country: 'USA',
    date: 'April 1, 2019',
    hour: '12:30',
    playersWithMaybe: 4,
    playersWithNo: 2,
    playersWithYes: 8,
    color: Color(0xff00b966),
    icon: baseball,
  )
];
