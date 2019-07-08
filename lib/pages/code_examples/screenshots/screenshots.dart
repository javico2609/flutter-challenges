import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:ui' as ui;
import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/pages/code_examples/redux/question_item.dart';
import 'package:playground_flutter/pages/code_examples/redux/redux.viewmodel.dart';
import 'package:playground_flutter/pages/code_examples/screenshots/preview.dart';
import 'package:playground_flutter/store/actions/stack_overflow.action.dart';
import 'package:playground_flutter/store/state/app.state.dart';

class ScreenshotPage extends StatefulWidget {
  ScreenshotPage({Key key}) : super(key: key);

  _ScreenshotPageState createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  GlobalKey _globalKey = new GlobalKey();

  Future<void> _captureScreenshot(_globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var png = byteData.buffer.asUint8List();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => new PreviewScreenshot(photo: png),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screenshot'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {
              _captureScreenshot(_globalKey);
            },
          )
        ],
      ),
      body: StoreConnector<AppState, ReduxViewModel>(
        distinct: true,
        converter: (store) => ReduxViewModel.fromStore(store),
        onInit: (store) =>
            store.dispatch(new LoadQuestionAction(paginate: false)),
        builder: (_, vm) {
          // global and first loading indicator
          if (vm.state.loading) {
            return Center(
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.blue),
                child: CircularProgressIndicator(),
              ),
            );
          }

          return RepaintBoundary(
            key: _globalKey,
            child: ListView.builder(
              itemCount: vm.questions.length,
              itemBuilder: (_, int index) {
                StackOverflowModel model = vm.questions[index];
                GlobalKey _globalKey = new GlobalKey();
                return RepaintBoundary(
                  key: _globalKey,
                  child: QuestionItem(
                    key: Key(model.questionId.toString()),
                    model: model,
                    onDelete: vm.onDelete,
                    onView: (item) {
                      _captureScreenshot(_globalKey);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
