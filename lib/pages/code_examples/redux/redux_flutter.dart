import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/pages/code_examples/redux/question_item.dart';
import 'package:playground_flutter/pages/code_examples/redux/redux.viewmodel.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/app.state.dart';

class ReduxFlutter extends StatefulWidget {
  const ReduxFlutter({Key key}) : super(key: key);

  @override
  _ReduxFlutterState createState() => _ReduxFlutterState();
}

class _ReduxFlutterState extends State<ReduxFlutter> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // only execute pagination event if it's the last item
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        var store = StoreProvider.of<AppState>(context);
        var state = store.state.stackOverflowState;

        // only dispach pagination event if has more items
        if (state.has_more) {
          store.dispatch(new LoadQuestionAction(paginate: true));
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        onInit: (store) =>
            store.dispatch(new LoadQuestionAction(paginate: false)),
        builder: (_, vm) {
          print("Distinct check ${vm.state.questions.length} !!!!!!");

          // global and first loading indicator
          if (vm.state.loading) {
            return Center(
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.blue),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              vm.onLoad();
              await Future.delayed(Duration(seconds: 2));
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: vm.state.questions.length,
              itemBuilder: (_, int index) {
                // show pagination loading indicator at the bottom of the list
                if (vm.state.paginate &&
                    vm.state.questions.length - 1 == index) {
                  return Container(
                    height: 50,
                    child: Center(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(accentColor: Colors.blue),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }

                StackOverflowModel model = vm.state.questions[index];
                return QuestionItem(
                  key: Key(model.questionId.toString()),
                  model: model,
                  onDelete: vm.onDelete,
                  onView: vm.onView,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
