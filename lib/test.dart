import 'package:example/firebase_options.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:example/services/app.service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const FireFlutterExample());
}

class FireFlutterExample extends StatefulWidget {
  const FireFlutterExample({super.key});

  @override
  State<FireFlutterExample> createState() => _FireFlutterExampleState();
}

class _FireFlutterExampleState extends State<FireFlutterExample> {
  @override
  void initState() {
    super.initState();
    AppService.instance.init();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: const TestUi(),
      ),
    );
  }
}
