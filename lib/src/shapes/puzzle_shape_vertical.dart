import 'package:flutter/material.dart';

class VerticalPuzzlePainter extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;
  final bool hasTopTab;
  final bool hasBottomTab;

  VerticalPuzzlePainter({
    required this.backgroundColor,
    required this.borderColor,
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

    // Start at the top-left corner
    path.moveTo(0, 0);

    // Top edge
    if (hasTopTab) {
      path.lineTo(size.width * 0.35, 0); // Start of the top tab
      path.cubicTo(
        size.width * 0.25, // Control point 1 (x)
        size.height * -0.25, // Control point 1 (y)
        size.width * 0.5, // Control point 2 (x)
        size.height * -0.25, // Control point 2 (y)
        size.width * 0.5, // End point (x)
        size.height * -0.25, // End point (y)
      );
      path.cubicTo(
        size.width * 0.5, // Control point 1 (x)
        size.height * -0.25, // Control point 1 (y)
        size.width * 0.75, // Control point 2 (x)
        size.height * -0.25, // Control point 2 (y)
        size.width * 0.65, // End point (x)
        0, // End point (y)
      );
    }
    path.lineTo(size.width, 0); // Top-right corner

    // Right edge
    path.lineTo(size.width, size.height);

    // Bottom edge
    if (hasBottomTab) {
      path.lineTo(size.width * 0.65, size.height); // Start of the bottom tab
      path.cubicTo(
        size.width * 0.75, // Control point 1 (x)
        size.height * 1.15, // Control point 1 (y)
        size.width * 0.55, // Control point 2 (x)
        size.height * 1.15, // Control point 2 (y)
        size.width * 0.5, // End point (x)
        size.height * 1.15, // End point (y)
      );
      path.cubicTo(
        size.width * 0.45, // Control point 1 (x)
        size.height * 1.15, // Control point 1 (y)
        size.width * 0.25, // Control point 2 (x)
        size.height * 1.15, // Control point 2 (y)
        size.width * 0.35, // End point (x)
        size.height, // End point (y)
      );
    }
    path.lineTo(0, size.height); // Bottom-left corner

    // Left edge
    path.lineTo(0, 0);

    path.close();

    // Draw the filled shape
    canvas.drawPath(path, paint);

    // Draw the border
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
