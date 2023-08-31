import 'package:example/config.dart';

/// This will run when the app is closed (terminated).
/// ! Attention - This function will not run when the app is in backround mode. They made a mistake on naming the event handler.
/// See https://firebase.google.com/docs/cloud-messaging/flutter/receive#apple_platforms_and_android for details.
///
/// You can update the app badge here to display the updated number of chat messages.
Future<void> onTerminatedMessage(message) async {
  // if (Platform.isAndroid == false && Platform.isIOS == false) {
  if (Config.isMobile == false) {
    return;
  }
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  // print("---> Handling a background message: ${message.messageId}");
  // if (message.data['type'] == 'chat' && message.data['badge'] != null && message.data['badge'] != '') {
  //   FlutterAppBadger.updateBadgeCount(int.parse(message.data['badge']));
  // }
}
