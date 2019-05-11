import 'package:playground_flutter/home.dart';
import 'package:playground_flutter/pages/navigation-bars/3d_bottom_navigation_bar.dart';
import 'package:playground_flutter/pages/navigation-bars/bottom_with_float_button.dart';
import 'package:playground_flutter/pages/progress-button/progress-button.dart';
import 'package:playground_flutter/pages/templates/daycare-clone/daycare-home.dart';
import 'package:playground_flutter/pages/templates/furniture-clone/furniture-home.dart';
import 'package:playground_flutter/pages/templates/game-organizer-clone/game-organizer-home.dart';
import 'package:playground_flutter/pages/templates/greenery-clone/greenery-home.dart';
import 'package:playground_flutter/pages/templates/hospital-dashboard-clone/hospital-dashboard-home.dart';
import 'package:playground_flutter/pages/templates/news-app-concept-clone/news-app-concept-home.dart';
import 'package:playground_flutter/pages/templates/profile-one.dart';
import 'package:playground_flutter/pages/templates/real-estate-clone/real-estate-home.dart';
import 'package:playground_flutter/pages/templates/smart-home-clone/smart-home-home.dart';
import 'package:playground_flutter/pages/templates/smart-plant-clone/smart-plant-home.dart';
import 'package:playground_flutter/pages/templates/trending.dart';
import 'package:playground_flutter/pages/templates/whatsapp-clone/whatsapp_home.dart';

var routes = {
  '/': (context) => MyHomePage(),
  '/BottomBarWithFloatButton': (context) => BottomBarWithFloatButton(),
  '/ThreeDimenssionBottomNavigationBar': (context) =>
      new ThreeDimenssionBottomNavigationBar(),
  '/Trending': (context) => new Trending(),
  '/ProfileOne': (context) => new ProfileOne(),
  '/WhatsApp': (context) => new WhatsAppHome(),
  '/Greenery': (context) => new GreeneryHome(),
  '/ProgressButton': (context) => new ProgressButton(),
  '/Daycare': (context) => new DaycareHome(),
  '/RealEstate': (context) => new RealEstateHome(),
  '/SmartPlant': (context) => new SmartPlantHome(),
  '/HospitalDashboard': (context) => new HospitalDashboardHome(),
  '/NewsAppConcept': (context) => new NewsAppConceptHome(),
  '/Furniture': (context) => new FurnitureHome(),
  '/GameOrganizer': (context) => new GameOrganizerHome(),
  '/SmartHome': (context) => new SmartHome(),
};
