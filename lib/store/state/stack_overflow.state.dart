import 'package:playground_flutter/models/stackoverflow.model.dart';

class StackOverflowState {
  List<StackOverflowModel> questions;
  StackOverflowModel selected;

  StackOverflowState({this.questions, this.selected});

  StackOverflowState.initialState()
      : questions = List.unmodifiable([]),
        selected = null;

  StackOverflowState copyWith({q, s}) => new StackOverflowState(
        questions: q ?? questions,
        selected: s ?? selected,
      );
}
