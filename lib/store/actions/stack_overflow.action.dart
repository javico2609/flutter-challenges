import 'package:flutter/foundation.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';

class LoadQuestionAction {
  final bool paginate;

  LoadQuestionAction({this.paginate});
}

class LoadQuestionSuccessAction {
  final List<StackOverflowModel> questions;
  final bool paginate;
  final bool hasMore;

  LoadQuestionSuccessAction({
    @required this.questions,
    this.paginate,
    this.hasMore,
  });
}

class LoadQuestionFailureAction {
  final dynamic error;

  LoadQuestionFailureAction({@required this.error});
}

class DeleteQuestionAction {
  final StackOverflowModel question;

  DeleteQuestionAction({@required this.question});
}

class DeleteSuccessQuestionAction {
  final StackOverflowModel question;

  DeleteSuccessQuestionAction({@required this.question});
}

class ViewQuestionAction {
  final StackOverflowModel question;

  ViewQuestionAction({@required this.question});
}

class SearchByAction {
  final String searchText;

  SearchByAction({this.searchText});
}
