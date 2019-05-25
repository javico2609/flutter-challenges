import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/routes.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/constants/navigation.dart';
import 'package:playground_flutter/environment.dart';
import 'package:playground_flutter/store/state/app.state.dart';
import 'package:redux/redux.dart';

void main() async {
  final Store<AppState> store = await Environment.setup();

  return runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StreamBuilder<Object>(
          stream: themeBloc.themeEnabled,
          builder: (context, snapshot) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: getThemeByType(snapshot.data),
              initialRoute: '/',
              debugShowCheckedModeBanner: false,
              onGenerateRoute: generateRoutes,
              //routes: routes,
              navigatorKey: NavigationConstrants.navKey,
            );
          }),
    );
  }
}
