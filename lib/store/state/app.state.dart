import 'package:flutter/foundation.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';

class AppState {
  final StackOverflowState stackOverflowState;

  AppState({
    @required this.stackOverflowState,
  });

  AppState.initialState({stackOverflowState})
      : stackOverflowState =
            stackOverflowState ?? StackOverflowState.initialState();
}
