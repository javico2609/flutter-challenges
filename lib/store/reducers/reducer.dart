import 'package:playground_flutter/store/reducers/stack_overflow.reducer.dart';
import 'package:playground_flutter/store/state/app.state.dart';

AppState rootReducer(AppState state, action) {
  return AppState(
    stackOverflowState: stackOverflowReducer(state.stackOverflowState, action),
  );
}
