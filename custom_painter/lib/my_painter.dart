import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  const MyPainter();
  static final painter = Paint()
    ..strokeWidth = 2
    ..color = Colors.redAccent
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final rect1 = Rect.fromPoints(Offset(10, 10), Offset(200, 200));
    final rect2 = Rect.fromPoints(Offset(50, 50), Offset(250, 250));
    canvas.drawRect(rect1, painter);
    canvas.drawRect(rect2, painter);
    canvas.drawLine(rect1.topLeft, rect2.topLeft, painter);
    canvas.drawLine(rect1.topRight, rect2.topRight, painter);
    canvas.drawLine(rect1.bottomRight, rect2.bottomRight, painter);
    canvas.drawLine(rect1.bottomLeft, rect2.bottomLeft, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
