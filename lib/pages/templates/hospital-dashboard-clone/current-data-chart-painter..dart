import 'package:flutter/material.dart';

class CurrentDataChartPainter extends CustomPainter {
  final Color color;

  CurrentDataChartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint trackBarPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    Paint trackBarPaintOpacity = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    Path trackBarPath = Path();
    Path trackBarPathOpacity = Path();

    List val = [
      size.height * 0.3,
      size.height * 0.4,
      size.height * 0.7,
      size.height * 0.15,
      size.height * 0.35,
    ];

    double origin = 10;

    for (int i = 0; i < val.length; i++) {
      if (i != 3) {
        trackBarPathOpacity.moveTo(origin, size.height);
        trackBarPathOpacity.lineTo(origin, val[i]);
      } else {
        trackBarPath.moveTo(origin, size.height);
        trackBarPath.lineTo(origin, val[i]);
      }

      origin = origin + size.width * 0.15;
    }

    canvas.drawPath(trackBarPath, trackBarPaint);
    canvas.drawPath(trackBarPathOpacity, trackBarPaintOpacity);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
