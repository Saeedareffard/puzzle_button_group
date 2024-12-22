import 'package:flutter/material.dart';
import 'package:puzzle_button_group/puzzle_button_group.dart';

class PuzzleButtonGroup extends StatelessWidget {
  final List<Widget>
      children; // Each child should handle its own onPressed callback
  final Axis axis;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsets padding;

  const PuzzleButtonGroup({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.backgroundColor = Colors.blue,
    this.borderColor = Colors.black,
    this.padding = const EdgeInsets.all(4.0),
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    if (children.length == 1) {
      return _buildPuzzleButton(
        child: children.first,
        hasTopTab: false,
        hasBottomTab: false,
        hasLeftTab: false,
        hasRightTab: false,
      );
    }

    final buttons = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      final isFirst = i == 0;
      final isLast = i == children.length - 1;

      buttons.add(
        _buildPuzzleButton(
          child: Padding(
            padding: padding,
            child: children[i],
          ),
          hasTopTab: axis == Axis.vertical && !isFirst,
          hasBottomTab: axis == Axis.vertical && !isLast,
          hasLeftTab: axis == Axis.horizontal && !isFirst,
          hasRightTab: axis == Axis.horizontal && !isLast,
        ),
      );
    }

    return axis == Axis.horizontal
        ? Row(mainAxisSize: MainAxisSize.min, children: buttons)
        : Column(mainAxisSize: MainAxisSize.min, children: buttons);
  }

  Widget _buildPuzzleButton({
    required Widget child,
    required bool hasTopTab,
    required bool hasBottomTab,
    required bool hasLeftTab,
    required bool hasRightTab,
  }) {
    final painter = axis == Axis.horizontal
        ? HorizontalPuzzlePainter(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            hasTopTab: hasTopTab,
            hasBottomTab: hasBottomTab,
            hasLeftTab: hasLeftTab,
            hasRightTab: hasRightTab,
          )
        : VerticalPuzzlePainter(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            hasTopTab: hasTopTab,
            hasBottomTab: hasBottomTab,
          );

    return CustomPaint(
      painter: painter,
      child: child,
    );
  }
}
