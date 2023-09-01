import 'package:example/firebase_options.dart';
import 'package:example/router.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FireFlutterService.instance.init(context: router.routerDelegate.navigatorKey.currentContext!);
      toast(title: 'hi', message: 'message', onTap: (close) => close());
    });
  }

  @override
  Widget build(BuildContext context) {
    AppService.instance.init();
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
