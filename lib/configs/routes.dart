import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:playground_flutter/constants/navigation.dart';
import 'package:playground_flutter/home.dart';
import 'package:playground_flutter/pages/code_examples/auth_google/auth_google.dart';
import 'package:playground_flutter/pages/code_examples/download_and_shared/download_and_share.dart';
import 'package:playground_flutter/pages/code_examples/firebase_crud/firebase_crud.dart';
import 'package:playground_flutter/pages/code_examples/mapbox/mapbox.dart';
import 'package:playground_flutter/pages/code_examples/navigation-bars/3d_bottom_navigation_bar.dart';
import 'package:playground_flutter/pages/code_examples/navigation-bars/bottom_with_float_button.dart';
import 'package:playground_flutter/pages/code_examples/pdf_and_csv/csv.dart';
import 'package:playground_flutter/pages/code_examples/pdf_and_csv/pdf.dart';
import 'package:playground_flutter/pages/code_examples/progress-button/progress-button.dart';
import 'package:playground_flutter/pages/code_examples/redux/preview_question.dart';
import 'package:playground_flutter/pages/code_examples/redux/redux_flutter.dart';
import 'package:playground_flutter/pages/code_examples/screenshots/screenshots.dart';
import 'package:playground_flutter/pages/code_examples/sqlite/sqlite.dart';
import 'package:playground_flutter/pages/code_examples/touchid/touchid.dart';
import 'package:playground_flutter/pages/code_examples/webview/webview.dart';
import 'package:playground_flutter/pages/templates/calculator-check-list-clone/calculator-check-list.dart';
import 'package:playground_flutter/pages/templates/crypto-blockchain-wallet-clone/crypto-blockchain-wallet.dart';
import 'package:playground_flutter/pages/templates/daycare-clone/daycare-home.dart';
import 'package:playground_flutter/pages/templates/furniture-clone/furniture-home.dart';
import 'package:playground_flutter/pages/templates/game-organizer-clone/game-organizer-home.dart';
import 'package:playground_flutter/pages/templates/greenery-clone/greenery-home.dart';
import 'package:playground_flutter/pages/templates/hospital-dashboard-clone/hospital-dashboard-home.dart';
import 'package:playground_flutter/pages/templates/network-of-gas-stations-clone/network-of-gas-stations-home.dart';
import 'package:playground_flutter/pages/templates/news-app-concept-clone/news-app-concept-home.dart';
import 'package:playground_flutter/pages/templates/profile-one.dart';
import 'package:playground_flutter/pages/templates/quant-hotels-booking-clone/quant-hotels-booking-clone.dart';
import 'package:playground_flutter/pages/templates/rahul-sliver-profile-demo/rahul-sliver-profile.dart';
import 'package:playground_flutter/pages/templates/real-estate-clone/real-estate-home.dart';
import 'package:playground_flutter/pages/templates/smart-home-clone/smart-home-home.dart';
import 'package:playground_flutter/pages/templates/smart-plant-clone/smart-plant-home.dart';
import 'package:playground_flutter/pages/templates/stayfit-health-clone/stayfit-health-home.dart';
import 'package:playground_flutter/pages/templates/trending.dart';
import 'package:playground_flutter/pages/templates/whatsapp-clone/whatsapp_home.dart';
import 'package:playground_flutter/services/notification.service.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case NavigationConstrants.BottomBarWithFloatButton:
      return buildRoute(settings, BottomBarWithFloatButton());
    case NavigationConstrants.ThreeDimenssionBottomNavigationBar:
      return buildRoute(settings, ThreeDimenssionBottomNavigationBar());
    case NavigationConstrants.Trending:
      return buildRoute(settings, Trending());
    case NavigationConstrants.ProfileOne:
      return buildRoute(settings, ProfileOne());
    case NavigationConstrants.WhatsApp:
      return buildRoute(settings, WhatsAppHome());
    case NavigationConstrants.Greenery:
      return buildRoute(settings, GreeneryHome());
    case NavigationConstrants.ProgressButton:
      return buildRoute(settings, ProgressButton());
    case NavigationConstrants.Daycare:
      return buildRoute(settings, DaycareHome());
    case NavigationConstrants.RealEstate:
      return buildRoute(settings, RealEstateHome());
    case NavigationConstrants.SmartPlant:
      return buildRoute(settings, SmartPlantHome());
    case NavigationConstrants.HospitalDashboard:
      return buildRoute(settings, HospitalDashboardHome());
    case NavigationConstrants.NewsAppConcept:
      return buildRoute(settings, NewsAppConceptHome());
    case NavigationConstrants.Furniture:
      return buildRoute(settings, FurnitureHome());
    case NavigationConstrants.GameOrganizer:
      return buildRoute(settings, GameOrganizerHome());
    case NavigationConstrants.SmartHome:
      return buildRoute(settings, SmartHome());
    case NavigationConstrants.GoogleAuth:
      return buildRoute(settings, GoogleAuth());
    case NavigationConstrants.WebviewFlutter:
      return buildRoute(settings, WebviewFlutter());
    case NavigationConstrants.ReduxFlutter:
      return buildRoute(settings, ReduxFlutter());
    case NavigationConstrants.ReduxViewQuestion:
      return buildRoute(settings, PreviewQuestion());
    case NavigationConstrants.CryptoBlockchainWallet:
      return buildRoute(settings, CryptoBlockchainWallet());
    case NavigationConstrants.NetworkGasStationHome:
      return buildRoute(settings, NetworkGasStationHome());
    case NavigationConstrants.MapBoxDemo:
      return buildRoute(settings, MapBoxDemo());
    case NavigationConstrants.SqliteDemo:
      return buildRoute(settings, SqliteDemo());
    case NavigationConstrants.FirebaseDemo:
      return buildRoute(settings, FirebaseDemo());
    case NavigationConstrants.PdfGeneratorDemo:
      return buildRoute(settings, PdfGeneratorDemo());
    case NavigationConstrants.CsvGeneratorDemo:
      return buildRoute(settings, CsvGeneratorDemo());
    case NavigationConstrants.RahulSliverProfile:
      return buildRoute(settings, RahulSliverProfile());
    case NavigationConstrants.TouchIdDemo:
      return buildRoute(settings, TouchIdDemo());
    case NavigationConstrants.DownloadAndShareDemo:
      return buildRoute(settings, DownloadAndSharePage());
    case NavigationConstrants.ScreenshotDemo:
      return buildRoute(settings, ScreenshotPage());
    case NavigationConstrants.StayfitHealthHome:
      return buildRoute(settings, StayfitHealthPage());
    case NavigationConstrants.CalculatorChecklistHome:
      return buildRoute(settings, CalculatorChecklistHome());
    case NavigationConstrants.QuantHotelsBookingPage:
      return buildRoute(settings, QuantHotelsBookingPage());
    // TODO: notification section
    case NavigationConstrants.NOTIFICATION_SUCCESS:
      return buildNotification(NotificationService.successFactory());
    case NavigationConstrants.NOTIFICATION_ERROR:
      return buildNotification(NotificationService.errorFactory());
    default:
      return buildRoute(settings, MyHomePage());
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}

FlushbarRoute buildNotification(Flushbar type) {
  return FlushbarRoute(
    theme: ThemeData.light(),
    flushbar: type,
    settings: RouteSettings(name: FLUSHBAR_ROUTE_NAME),
  );
}
