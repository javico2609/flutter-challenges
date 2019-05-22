import 'package:flutter/foundation.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';

class LoadQuestionAction {}

class LoadQuestionSuccessAction {
  final List<StackOverflowModel> questions;

  LoadQuestionSuccessAction({@required this.questions});
}

class LoadQuestionFailureAction {
  final dynamic error;

  LoadQuestionFailureAction({@required this.error});
}

class DeleteQuestionAction {
  final StackOverflowModel question;

  DeleteQuestionAction({@required this.question});
}

class ViewQuestionAction {
  final StackOverflowModel question;

  ViewQuestionAction({@required this.question});
}
