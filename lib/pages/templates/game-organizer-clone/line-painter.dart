import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'dart:math' as math;

class LinePainter extends CustomPainter {
  Paint backgroundPaint = Paint()
    ..color = Colors.grey.withOpacity(0.4)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    Path backgroundPath = Path();

    backgroundPath.moveTo(0, size.height / 2);
    backgroundPath.lineTo(size.width, size.height / 2);

    canvas.drawPath(
      dashPath(
        backgroundPath,
        dashArray: CircularIntervalList(<double>[3, 6]),
      ),
      backgroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
