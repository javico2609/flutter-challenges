import 'package:flutter/material.dart';
import 'package:playground_flutter/models/stackoverflow.model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PreviewQuestion extends StatelessWidget {
  final StackOverflowModel model;
  const PreviewQuestion({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        key: Key("webview"),
        initialUrl: model.link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
