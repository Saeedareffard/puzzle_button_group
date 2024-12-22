import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:puzzle_button_group/puzzle_button_group.dart';

void main() {
  group('PuzzleButtonGroup Tests', () {
    testWidgets('PuzzleButtonGroup renders correctly',
        (WidgetTester tester) async {
      const testKey = Key('puzzle_button_group');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PuzzleButtonGroup(
              key: testKey,
              children: [
                Text('Button 1'),
                Text('Button 2'),
                Text('Button 3'),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.text('Button 1'), findsOneWidget);
      expect(find.text('Button 2'), findsOneWidget);
      expect(find.text('Button 3'), findsOneWidget);
    });

    testWidgets('PuzzleButtonGroup has correct number of children',
        (WidgetTester tester) async {
      const testKey = Key('puzzle_button_group');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PuzzleButtonGroup(
              key: testKey,
              children: [
                Text('Button 1'),
                Text('Button 2'),
                Text('Button 3'),
              ],
            ),
          ),
        ),
      );

      final buttonCount = find.byType(Text).evaluate().length;
      expect(buttonCount, 3);
    });

    testWidgets('PuzzleButtonGroup displays horizontally',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PuzzleButtonGroup(
              axis: Axis.horizontal,
              children: [
                Text('Button 1'),
                Text('Button 2'),
                Text('Button 3'),
              ],
            ),
          ),
        ),
      );

      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('PuzzleButtonGroup displays vertically',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PuzzleButtonGroup(
              axis: Axis.vertical,
              children: [
                Text('Button 1'),
                Text('Button 2'),
                Text('Button 3'),
              ],
            ),
          ),
        ),
      );

      final columnFinder = find.byType(Column);
      expect(columnFinder, findsOneWidget);
    });
  });
}
