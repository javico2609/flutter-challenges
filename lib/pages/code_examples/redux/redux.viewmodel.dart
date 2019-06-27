import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/selectors/stack_overflow.selector.dart';
import 'package:playground_flutter/store/state/app.state.dart';
import 'package:playground_flutter/store/state/stack_overflow.state.dart';
import 'package:redux/redux.dart';

class ReduxViewModel {
  final StackOverflowState state;
  final List<StackOverflowModel> questions;
  final Function(StackOverflowModel) onDelete;
  final Function(StackOverflowModel) onView;
  final Function onLoad;

  ReduxViewModel({
    this.state,
    this.onDelete,
    this.onView,
    this.onLoad,
    this.questions,
  });

  static ReduxViewModel fromStore(Store<AppState> store) {
    return new ReduxViewModel(
      state: store.state.stackOverflowState,
      // use the selector that i create before.
      // toList because its a list of questions. !!!
      questions:
          questionsByFilterSelector(store.state.stackOverflowState).toList(),
      onDelete: (question) => store.dispatch(
            new DeleteQuestionAction(question: question),
          ),
      onView: (question) => store.dispatch(
            new ViewQuestionAction(question: question),
          ),
      onLoad: () => store.dispatch(
            new LoadQuestionAction(paginate: false),
          ),
    );
  }

  // method to check if the state changed
  @override
  int get hashCode => state.uuid.hashCode;

  bool operator ==(other) {
    bool result = identical(this, other) || other is ReduxViewModel;

    if (result) {
      if (state.uuid != (other as ReduxViewModel).state.uuid) {
        return false;
      }
    }

    return result;
  }
}
