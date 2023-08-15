import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  static const String routeName = '/text_ui';
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Test"),
      ),
      body: const TestUi(),
    );
  }
}
