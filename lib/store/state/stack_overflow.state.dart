import 'package:playground_flutter/models/stackoverflow.model.dart';

class StackOverflowState {
  List<StackOverflowModel> questions;

  StackOverflowState({this.questions});

  StackOverflowState.initialState() : questions = List.unmodifiable([]);

  StackOverflowState copyWith({questions}) =>
      new StackOverflowState(questions: questions);
}
