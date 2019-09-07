import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground_flutter/configs/ioc.dart';
import 'package:playground_flutter/services/database.service.dart';
import 'package:playground_flutter/store/store.dart';

class Environment {
  static setup() async {
    // Make sure that the binary messenger binding are properly initialiazed
    WidgetsFlutterBinding.ensureInitialized();

    // lock orientation position
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // transparent status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    Ioc.setupIocDependency();
    await Ioc.get<SqliteDatabaseService>().initDatabase();

    return await createStore();
  }
}
