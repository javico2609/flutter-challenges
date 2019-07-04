import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

String uuid() => new Uuid().v1();

StackOverflowState loadQuestions(
    StackOverflowState state, LoadQuestionAction action) {
  return state.copyWith(
    // activate global loading only if not pagination active
    l: action.paginate ? false : true,
    paginate: action.paginate,
    uuid: uuid(),
    // reset page if use RefreshIndicator or first loadind
    page: action.paginate ? state.page : 1,
  );
}

StackOverflowState loadQuestionsSuccess(
    StackOverflowState state, LoadQuestionSuccessAction action) {
  return state.copyWith(
    l: false,
    // if pagination its actived i include the new items to the existing
    q: [
      if (action.paginate) ...state.questions,
      ...action.questions,
    ],
    page: action.hasMore ? state.page + 1 : state.page,
    // forcing  to change the state and execute StoreConector builder function
    uuid: uuid(),
    has_more: action.hasMore,
    paginate: false,
  );
}

StackOverflowState viewQuestion(
    StackOverflowState state, ViewQuestionAction action) {
  return state.copyWith(
    s: action.question,
    uuid: uuid(),
  );
}

StackOverflowState deleteQuestion(
    StackOverflowState state, DeleteSuccessQuestionAction action) {
  return state.copyWith(
    uuid: uuid(),
    q: state.questions
        .where((q) => q.questionId != action.question.questionId)
        .toList(),
  );
}

// Update store with the new search text.
StackOverflowState filterByAuthor(
    StackOverflowState state, SearchByAction action) {
  return state.copyWith(
    // forcing  to change the state and execute StoreConector builder function
    uuid: uuid(),
    searchText: action.searchText,
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
  new TypedReducer<StackOverflowState, SearchByAction>(filterByAuthor),
]);
