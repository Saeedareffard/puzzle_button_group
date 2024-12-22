import 'package:flutter/material.dart';

class HorizontalPuzzlePainter extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;
  final bool hasLeftTab;
  final bool hasRightTab;
  final bool hasTopTab;
  final bool hasBottomTab;

  HorizontalPuzzlePainter({
    required this.backgroundColor,
    required this.borderColor,
    this.hasLeftTab = false,
    this.hasRightTab = false,
    this.hasTopTab = false,
    this.hasBottomTab = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();

    // Top edge
    if (hasTopTab) {
      path.moveTo(size.width * 0.2, 0);
      path.lineTo(size.width * 0.35, 0);
      path.cubicTo(
        size.width * 0.25,
        size.height * -0.15,
        size.width * 0.45,
        size.height * -0.15,
        size.width * 0.5,
        size.height * -0.15,
      );
      path.cubicTo(
        size.width * 0.55,
        size.height * -0.15,
        size.width * 0.75,
        size.height * -0.15,
        size.width * 0.65,
        0,
      );
      path.lineTo(size.width * 0.8, 0);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
    }

    // Right edge
    if (hasRightTab) {
      path.lineTo(size.width, size.height * 0.35);
      path.cubicTo(
        size.width * 1.15,
        size.height * 0.25,
        size.width * 1.15,
        size.height * 0.45,
        size.width * 1.15,
        size.height * 0.5,
      );
      path.cubicTo(
        size.width * 1.15,
        size.height * 0.55,
        size.width * 1.15,
        size.height * 0.75,
        size.width,
        size.height * 0.65,
      );
      path.lineTo(size.width, size.height);
    } else {
      path.lineTo(size.width, size.height);
    }

    // Bottom edge
    if (hasBottomTab) {
      path.lineTo(size.width * 0.65, size.height);
      path.cubicTo(
        size.width * 0.75,
        size.height * 1.15,
        size.width * 0.55,
        size.height * 1.15,
        size.width * 0.5,
        size.height * 1.15,
      );
      path.cubicTo(
        size.width * 0.45,
        size.height * 1.15,
        size.width * 0.25,
        size.height * 1.15,
        size.width * 0.35,
        size.height,
      );
      path.lineTo(size.width * 0.2, size.height);
    } else {
      path.lineTo(0, size.height);
    }

    // Left edge
    if (hasLeftTab) {
      path.lineTo(0, size.height * 0.65);
      path.cubicTo(
        size.width * -0.15,
        size.height * 0.75,
        size.width * -0.15,
        size.height * 0.55,
        size.width * -0.15,
        size.height * 0.5,
      );
      path.cubicTo(
        size.width * -0.15,
        size.height * 0.45,
        size.width * -0.15,
        size.height * 0.25,
        0,
        size.height * 0.35,
      );
      path.lineTo(0, 0);
    } else {
      path.lineTo(0, 0);
    }

    path.close();

    // Draw the filled shape
    canvas.drawPath(path, paint);

    // Draw the border
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
