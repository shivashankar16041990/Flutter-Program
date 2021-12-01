import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_ml_kit/google_ml_kit.dart';

class RectangularPainter extends CustomPainter {
  final List<Face> facesposition;
  final ui.Image selectedimage;
  static final Paint _painter = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0
    ..color = Colors.redAccent;

  const RectangularPainter(
      {required this.facesposition, required this.selectedimage});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(selectedimage, Offset.zero, Paint());
    for (final face in facesposition) {
      final coords = face.boundingBox;
      final rect =
          Rect.fromLTRB(coords.left, coords.top, coords.right, coords.bottom);
      canvas.drawRect(rect, _painter);
    }
  }

  @override
  bool shouldRepaint(RectangularPainter oldDelegate) {
    return selectedimage != oldDelegate.selectedimage ||
        facesposition != oldDelegate.facesposition;
  }
}
