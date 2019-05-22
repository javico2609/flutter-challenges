import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:playground_flutter/store/state/app.state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PreviewQuestion extends StatelessWidget {
  const PreviewQuestion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, StackOverflowModel>(
        converter: (store) => store.state.stackOverflowState.selected,
        builder: (_, StackOverflowModel vm) => WebView(
              key: Key("webview"),
              initialUrl: vm.link,
              javascriptMode: JavascriptMode.unrestricted,
            ),
      ),
    );
  }
}
