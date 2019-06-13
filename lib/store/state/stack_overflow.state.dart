import 'package:playground_flutter/models/stackoverflow.model.dart';

class StackOverflowState {
  List<StackOverflowModel> questions;
  StackOverflowModel selected;
  bool loading;

  StackOverflowState({
    this.questions,
    this.selected,
    this.loading,
  });

  StackOverflowState.initialState()
      : questions = List.unmodifiable([]),
        selected = null,
        loading = false;

  StackOverflowState copyWith({q, s, l}) => new StackOverflowState(
        questions: q ?? this.questions,
        selected: s ?? this.selected,
        loading: l ?? this.loading,
      );
}
