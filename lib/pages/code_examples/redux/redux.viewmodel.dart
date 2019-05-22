import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/app.state.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';
import 'package:redux/redux.dart';

class ReduxViewModel {
  final StackOverflowState state;
  final Function(StackOverflowModel) onDelete;
  final Function(StackOverflowModel) onView;

  ReduxViewModel({this.state, this.onDelete, this.onView});

  static ReduxViewModel fromStore(Store<AppState> store) {
    return new ReduxViewModel(
      state: store.state.stackOverflowState,
      onDelete: (question) =>
          store.dispatch(new DeleteQuestionActionAction(question: question)),
      onView: (question) =>
          store.dispatch(new ViewQuestionActionAction(question: question)),
    );
  }

  @override
  int get hashCode => state.questions.length.hashCode;

  bool operator ==(other) {
    bool result = identical(this, other) || other is ReduxViewModel;

    if (result) {
      if (state.questions.length !=
          (other as ReduxViewModel).state.questions.length) {
        return false;
      }
    }

    return result;
  }
}
