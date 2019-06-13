import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';
import 'package:redux/redux.dart';

StackOverflowState loadQuestions(
    StackOverflowState state, LoadQuestionAction action) {
  return state.copyWith(
    l: true,
    q: new List<StackOverflowModel>(),
  );
}

StackOverflowState loadQuestionsSuccess(
    StackOverflowState state, LoadQuestionSuccessAction action) {
  return state.copyWith(
    q: action.questions,
    l: false,
  );
}

StackOverflowState viewQuestion(
    StackOverflowState state, ViewQuestionAction action) {
  return state.copyWith(s: action.question);
}

StackOverflowState deleteQuestion(
    StackOverflowState state, DeleteSuccessQuestionAction action) {
  return state.copyWith(
    q: state.questions
        .where((q) => q.questionId != action.question.questionId)
        .toList(),
  );
}

final Reducer<StackOverflowState> stackOverflowReducer =
    combineReducers<StackOverflowState>([
  new TypedReducer<StackOverflowState, LoadQuestionSuccessAction>(
      loadQuestionsSuccess),
  new TypedReducer<StackOverflowState, LoadQuestionAction>(loadQuestions),
  new TypedReducer<StackOverflowState, DeleteSuccessQuestionAction>(
      deleteQuestion),
  new TypedReducer<StackOverflowState, ViewQuestionAction>(viewQuestion),
]);
