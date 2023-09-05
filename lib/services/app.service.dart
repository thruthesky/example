import 'package:example/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class AppService {
  static AppService? _instance;
  static AppService get instance => _instance ??= AppService._();

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  AppService._();

  /// For instantianciating the instance. Just call it whenever you need it.
  /// It will only instantiate the instance once.
  void init() {}

  displayForegroundMessage(RemoteMessage message) {
    print(message);
    // this will triggered while the app is opened
    // If the message has data, then do some extra work based on the data.
    if (UserService.instance.signedIn && UserService.instance.uid == message.data['senderUid']) {
      return;
    }

    if (message.data['type'] == 'chat') {
      // determined if the room is open dont send push notification
      // return if the message is coming from current chat room and the user is on the chat room.
      // if (message.data['senderUid'] == ChatService.instance.otherUser?.uid) {
      //   return;
      // }
    }

    String title = message.notification!.title ?? '';
    String body = message.notification!.body ?? '';

    if (title.length > 64) title = title.substring(0, 64);
    if (body.length > 128) body = body.substring(0, 128);

    toast(
      title: title,
      message: body,
      onTap: (x) {
        onMessageTapped(message);
        x();
      },
    );
  }

  onMessageTapped(RemoteMessage message) async {
    // Handle the message here
    print("onMessageTapped");
    print(message);

    /**
     * return if the the sender is also the current loggedIn user.
     */
    if (UserService.instance.signedIn && message.data['senderUid'] == UserService.instance.uid) {
      return;
    }

    /**
       * If the type is post then move it to a specific post.
       */
    if (message.data['type'] == 'post') {
      PostService.instance.showPostViewDialog(context, await Post.get(message.data['id']));
    }

    // /**
    //    * If the type is chat then move it to chat room.
    //    */
    // if (message.data['type'] == 'chat') {
    //   // @thruthesky fixed at 2022-09-24
    //   ChatRoomScreen.go(message.data['senderUid']);
    // }
  }
}
