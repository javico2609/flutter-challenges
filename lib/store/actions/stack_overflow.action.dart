import 'package:flutter/foundation.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';

class LoadQuestionActionAction {}

class LoadQuestionActionSuccessAction {
  final List<StackOverflowModel> questions;

  LoadQuestionActionSuccessAction({@required this.questions});
}

class LoadQuestionActionFailureAction {
  final dynamic error;

  LoadQuestionActionFailureAction({@required this.error});
}

class DeleteQuestionActionAction {
  final StackOverflowModel question;

  DeleteQuestionActionAction({@required this.question});
}

class ViewQuestionActionAction {
  final StackOverflowModel question;

  ViewQuestionActionAction({@required this.question});
}
