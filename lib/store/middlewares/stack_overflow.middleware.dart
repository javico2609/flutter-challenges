import 'package:playground_flutter/services/stack_overflow.service.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/app.state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> overflowMiddlewares() {
  final StackOverflowService service = new StackOverflowService();

  final loginRequest = _createLoadQuestionRequest(service);

  return ([
    TypedMiddleware<AppState, LoadQuestionActionAction>(loginRequest),
  ]);
}

Middleware<AppState> _createLoadQuestionRequest(StackOverflowService service) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    try {
      var questions = await service.list();
      store.dispatch(new LoadQuestionActionSuccessAction(questions: questions));
    } catch (error) {
      store.dispatch(new LoadQuestionActionFailureAction(error: error));
    }

    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  };
}
