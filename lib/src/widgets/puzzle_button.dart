import 'package:flutter/material.dart';

/// A base widget for a puzzle button.
class PuzzleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final CustomPainter painter;
  final Color backgroundColor;
  final Color borderColor;

  const PuzzleButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.painter,
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        painter: painter,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(8.0),
          child: Center(child: child),
        ),
      ),
    );
  }
}
