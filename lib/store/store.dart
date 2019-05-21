import 'package:playground_flutter/store/state/app.state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:playground_flutter/store/reducers/reducer.dart';

import 'middlewares/stack_overflow.middleware.dart';

Future<Store<AppState>> createStore() async {
  var prefs = await SharedPreferences.getInstance();

  var midlewares = overflowMiddlewares()
    ..addAll([new LoggingMiddleware.printer()]);

  return Store(
    rootReducer,
    initialState: AppState.initialState(
      stackOverflowState: null,
    ),
    middleware: midlewares,
  );
}
