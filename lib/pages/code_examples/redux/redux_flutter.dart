import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/pages/code_examples/redux/question_item.dart';
import 'package:playground_flutter/pages/code_examples/redux/redux.viewmodel.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/app.state.dart';

class ReduxFlutter extends StatelessWidget {
  const ReduxFlutter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff3f6),
      appBar: AppBar(
        title: Text('Redux example'),
      ),
      body: StoreConnector<AppState, ReduxViewModel>(
        distinct: true,
        converter: (store) => ReduxViewModel.fromStore(store),
        onInit: (store) => store.dispatch(new LoadQuestionAction()),
        builder: (_, vm) {
          print("Distinct check ${vm.state.questions.length} !!!!!!");
          if (vm.state.loading) {
            return Center(
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.blue),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ListView.builder(
            itemCount: vm.state.questions.length,
            itemBuilder: (_, int index) {
              StackOverflowModel model = vm.state.questions[index];
              return QuestionItem(
                model: model,
                onDelete: vm.onDelete,
                onView: vm.onView,
              );
            },
          );
        },
      ),
    );
  }
}
