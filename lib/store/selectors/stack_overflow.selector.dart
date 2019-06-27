import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';
import 'package:reselect/reselect.dart';

final allQuestionSelector = (StackOverflowState state) => state.questions;
final filterBySelector = (StackOverflowState state) => state.searchText;

// Create a memoized selector that only emit new value if any of your arguments change
// Selector help you optimize the store
// Selectors can compute derived data, allowing Redux to store the minimal possible state.
final questionsByFilterSelector = createSelector2(
    allQuestionSelector,
    filterBySelector,
    (List<StackOverflowModel> questions, String filterBy) => questions.where(
          (question) =>
              filterBy.length == 0 ||
              question.owner.displayName.contains(filterBy),
        ));
