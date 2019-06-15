import 'package:playground_flutter/constants/navigation.dart';
import 'package:playground_flutter/services/stack_overflow.service.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/app.state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> overflowMiddlewares() {
  final StackOverflowService service = new StackOverflowService();

  final loginRequest = _createLoadQuestionRequest(service);

  return ([
    TypedMiddleware<AppState, LoadQuestionAction>(loginRequest),
    TypedMiddleware<AppState, ViewQuestionAction>(_viewQuestion),
    TypedMiddleware<AppState, DeleteQuestionAction>(_deleteLocalQuestion),
  ]);
}

Middleware<AppState> _createLoadQuestionRequest(StackOverflowService service) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    try {
      // Propagate the action first for show loading indicator ( global and pagination )
      next(action);

      var response = await service.list(store.state.stackOverflowState.page);

      // dispatch success loading question ( first load and pagination load )
      store.dispatch(
        new LoadQuestionSuccessAction(
          questions: response.items,
          paginate: action.paginate,
          hasMore: response.hasMore,
        ),
      );
    } catch (error) {
      store.dispatch(new LoadQuestionFailureAction(error: error));
    }
  };
}

_viewQuestion(Store<AppState> store, action, NextDispatcher next) {
  NavigationConstrants.navKey.currentState
      .pushNamed(NavigationConstrants.ReduxViewQuestion);
  // Make sure to forward actions to the next middleware in the chain!
  next(action);
}

_deleteLocalQuestion(Store<AppState> store, action, NextDispatcher next) {
  // show success msg for delete local question from my store
  store.dispatch(new DeleteSuccessQuestionAction(question: action.question));

  NavigationConstrants.navKey.currentState
      .pushNamed(NavigationConstrants.NOTIFICATION_SUCCESS);
  // Make sure to forward actions to the next middleware in the chain!
  next(action);
}
