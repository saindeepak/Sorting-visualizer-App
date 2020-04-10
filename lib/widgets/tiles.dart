import 'package:flutter/material.dart';

class Tiles extends CustomPainter {
  int value;
  int idx;
  double width;
  Tiles({this.idx, this.value, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // paint.color = Colors.black;
    if (value >= 0 && value <= 100) {
      paint.color = Colors.cyanAccent;
    } else if (value >= 101 && value <= 200) {
      paint.color = Colors.tealAccent;
    } else if (value >= 201 && value <= 300) {
      paint.color = Colors.grey;
    } else if (value >= 301 && value <= 400) {
      paint.color = Colors.brown;
    } else {
      paint.color = Colors.blueGrey;
    }
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset((idx * width), 0),
        Offset((idx * width), value.ceilToDouble()), paint);
  }

  @override
  bool shouldRepaint(Tiles oldDelegate) {
    return true;
  }
}
