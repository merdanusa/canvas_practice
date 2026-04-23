import 'dart:math';
import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final double progress;

  ArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -pi / 2, 2 * pi, false, trackPaint);

    final arcPaint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, arcPaint);
  }

  @override
  bool shouldRepaint(ArcPainter old) => old.progress != progress;
}
