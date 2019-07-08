import 'dart:typed_data';

import 'package:flutter/material.dart';

class PreviewScreenshot extends StatelessWidget {
  final Uint8List photo;
  const PreviewScreenshot({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screenshot'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.memory(photo).image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
