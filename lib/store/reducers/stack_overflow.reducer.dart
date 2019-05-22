import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';
import 'package:redux/redux.dart';

StackOverflowState loadQuestions(
    StackOverflowState state, LoadQuestionSuccessAction action) {
  return state.copyWith(q: action.questions);
}

StackOverflowState viewQuestion(
    StackOverflowState state, ViewQuestionAction action) {
  return state.copyWith(s: action.question);
}

StackOverflowState deleteQuestion(
    StackOverflowState state, DeleteQuestionAction action) {
  return state.copyWith(
    q: state.questions
        .where((q) => q.questionId != action.question.questionId)
        .toList(),
  );
}

final Reducer<StackOverflowState> stackOverflowReducer =
    combineReducers<StackOverflowState>([
  new TypedReducer<StackOverflowState, LoadQuestionSuccessAction>(
      loadQuestions),
  new TypedReducer<StackOverflowState, DeleteQuestionAction>(deleteQuestion),
  new TypedReducer<StackOverflowState, ViewQuestionAction>(viewQuestion),
]);
