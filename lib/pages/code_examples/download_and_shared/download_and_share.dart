import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:playground_flutter/pages/code_examples/download_and_shared/progress_bar.dart';
import 'package:playground_flutter/services/web.client.dart';
import 'package:share_extend/share_extend.dart';

class DownloadAndSharePage extends StatefulWidget {
  DownloadAndSharePage({Key key}) : super(key: key);

  _DownloadAndSharePageState createState() => _DownloadAndSharePageState();
}

class _DownloadAndSharePageState extends State<DownloadAndSharePage>
    with SingleTickerProviderStateMixin {
  double _percentage;
  bool _progressDone;

  @override
  initState() {
    super.initState();
    _percentage = 0.0;
    _progressDone = false;
  }

  Widget getProgressText() {
    return Text(
      _percentage == 0 ? '' : '${_percentage.toInt()}',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: Colors.green,
      ),
    );
  }

  Widget progressView() {
    return CustomPaint(
      child: Center(
        child: _progressDone
            ? Icon(Icons.check, size: 50, color: Colors.green)
            : getProgressText(),
      ),
      foregroundPainter: ProgressPainter(
        defaultCircleColor: Colors.amber,
        percentageCompletedCircleColor: Colors.green,
        completedPercentage: _percentage,
        circleWidth: 20.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download and Share'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(30.0),
              child: progressView(),
            ),
            RaisedButton(
              child: Text("START"),
              onPressed: () async {
                setState(() {
                  _percentage = 0;
                  _progressDone = false;
                });

                // create temp file
                final String dir =
                    (await getApplicationDocumentsDirectory()).path;
                final String path = '$dir/download_demo.png';

                final File file = File(path);
                // -------

                //download 25mb image
                await http.download(
                  'http://www.effigis.com/wp-content/uploads/2015/02/DigitalGlobe_QuickBird_60cm_8bit_RGB_DRA_Boulder_2005JUL04_8bits_sub_r_1.jpg',
                  '$dir/download_demo.png',
                  showDownloadProgress,
                );
              },
            ),
            if (_progressDone)
              RaisedButton(
                child: Text("SHARE"),
                onPressed: () async {
                  // get file from local store
                  final String dir =
                      (await getApplicationDocumentsDirectory()).path;
                  final String path = '$dir/download_demo.png';

                  ShareExtend.share(path, "file");
                },
              ),
          ],
        ),
      ),
    );
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      //calculate %
      var percentage = (received / total * 100);
      // update progress state
      setState(() {
        if (percentage < 100) {
          _percentage = percentage;
        } else {
          _progressDone = true;
        }
      });
    }
  }
}
