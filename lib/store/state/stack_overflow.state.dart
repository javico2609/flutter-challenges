import 'package:playground_flutter/models/stackoverflow.model.dart';

class StackOverflowState {
  final List<StackOverflowModel> questions;
  final StackOverflowModel selected;
  final bool loading;

  final bool paginate;
  final int page;
  final bool has_more;
  // to force the change of state
  final String uuid;

  StackOverflowState({
    this.questions,
    this.selected,
    this.loading,
    this.page,
    this.paginate,
    this.has_more,
    this.uuid,
  });

  StackOverflowState.initialState()
      : questions = List.unmodifiable([]),
        selected = null,
        loading = false,
        paginate = false,
        page = 1,
        has_more = false,
        uuid = '';

  StackOverflowState copyWith({q, s, l, paginate, has_more, uuid, page}) =>
      new StackOverflowState(
        questions: q ?? this.questions,
        selected: s ?? this.selected,
        loading: l ?? this.loading,
        paginate: paginate ?? paginate,
        has_more: has_more ?? this.has_more,
        uuid: uuid ?? this.uuid,
        page: page ?? this.page,
      );
}
