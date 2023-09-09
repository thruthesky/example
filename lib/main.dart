import 'package:example/firebase_options.dart';
import 'package:example/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    UserService.instance.init(adminUid: '...xxx...');
    // init here
    MessagingService.instance.init(
      onBackgroundMessage: null,
      onForegroundMessage: (RemoteMessage message) {
        AppService.instance.displayForegroundMessage(message);
      },
      onMessageOpenedFromTerminated: (RemoteMessage message) {
        WidgetsBinding.instance.addPostFrameCallback((duration) {
          AppService.instance.onMessageTapped(message);
        });
      },
      onMessageOpenedFromBackground: (RemoteMessage message) {
        AppService.instance.onMessageTapped(message);
      },
      onNotificationPermissionDenied: () {
        toast(
          title: 'Permission Denied',
          message:
              'Please allow notification permission to receive push notifications.',
        );
      },
      onNotificationPermissionNotDetermined: () {
        toast(
          title: 'Permission Not Determined',
          message:
              'Please allow notification permission to receive push notifications.',
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FireFlutterService.instance
          .init(context: router.routerDelegate.navigatorKey.currentContext!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
