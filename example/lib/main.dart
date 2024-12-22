import 'package:flutter/material.dart';
import 'package:puzzle_button_group/puzzle_button_group.dart';

void main() {
  runApp(const PuzzleButtonGroupExampleApp());
}

class PuzzleButtonGroupExampleApp extends StatelessWidget {
  const PuzzleButtonGroupExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle Button Group Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PuzzleButtonGroupDemo(),
    );
  }
}

class PuzzleButtonGroupDemo extends StatelessWidget {
  const PuzzleButtonGroupDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle Button Group Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Horizontal Puzzle Button Group
            PuzzleButtonGroup(
              axis: Axis.horizontal,
              backgroundColor: Colors.blue,
              borderColor: Colors.white,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Button 1'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Button 2'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Button 3'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Vertical Puzzle Button Group
            PuzzleButtonGroup(
              axis: Axis.vertical,
              backgroundColor: Colors.green,
              borderColor: Colors.black,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Button 1'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Button 2'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Button 3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
