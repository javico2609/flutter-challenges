import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'dart:math' as math;

class ChartPainter extends CustomPainter {
  Paint backgroundPaint = Paint()
    ..color = Color(0xff4298ff)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2;

  Paint valuePaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    Path backgroundPath = Path();
    Path valuePath = Path();

    int jump = 23;

    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        backgroundPath.moveTo(jump * i, 0);
        backgroundPath.lineTo(jump * i, size.height);
      }

      int random = range(50, (size.height - (size.height * .3)).toInt());

      valuePath.moveTo(jump * i, random.toDouble());
      valuePath.lineTo(jump * i, random.toDouble() + size.height * .3);
    }

    canvas.drawPath(
      dashPath(
        backgroundPath,
        dashArray: CircularIntervalList(<double>[3, 6]),
      ),
      backgroundPaint,
    );

    canvas.drawPath(valuePath, valuePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  int range(int minOrMax, [int max]) {
    if (max == null) {
      max = minOrMax;
      minOrMax = 0;
    }

    return math.Random().nextInt(max - minOrMax) + minOrMax;
  }
}
