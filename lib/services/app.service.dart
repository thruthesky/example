import 'package:example/functions/functions.dart';
import 'package:example/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class AppService {
  static AppService? _instance;
  static AppService get instance => _instance ??= AppService();

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  AppService() {
    // init here
    MessagingService.instance.init(
      // while the app is close and notification arrive you can use this to do small work
      // example are changing the badge count or informing backend.
      onBackgroundMessage: onTerminatedMessage,

      ///
      onForegroundMessage: (RemoteMessage message) {
        onForegroundMessage(message);
      },
      onMessageOpenedFromTerminated: (message) {
        // this will triggered when the notification on tray was tap while the app is closed
        // if you change screen right after the app is open it display only white screen.
        WidgetsBinding.instance.addPostFrameCallback((duration) {
          onTapMessage(message);
        });
      },
      // this will triggered when the notification on tray was tap while the app is open but in background state.
      onMessageOpenedFromBackground: (message) {
        onTapMessage(message);
      },
      onNotificationPermissionDenied: () {
        // print('onNotificationPermissionDenied()');
      },
      onNotificationPermissionNotDetermined: () {
        // print('onNotificationPermissionNotDetermined()');
      },
    );
  }

  /// For instantianciating the instance. Just call it whenever you need it.
  /// It will only instantiate the instance once.
  void init() {}

  onForegroundMessage(RemoteMessage message) {
    print(message);
    // this will triggered while the app is opened
    // If the message has data, then do some extra work based on the data.
    if (UserService.instance.signedIn && UserService.instance.uid == message.data['senderUid']) {
      return;
    }

    // if (message.data['type'] == 'chat') {
    //   // determin if the room is open dont send push notification
    //   // return if the message is coming from current chat room and the user is on the chat room.
    //   if (message.data['senderUid'] == ChatService.instance.otherUser?.uid) {
    //     return;
    //   }

    //   //
    //   if (Config.isMobile) {
    //     if (message.data['badge'] != null && message.data['badge'] != '') {
    //       FlutterAppBadger.updateBadgeCount(int.parse(message.data['badge']));
    //     }
    //   }
    // }

    String title = message.notification!.title ?? '';
    String body = message.notification!.body ?? '';

    if (title.length > 64) title = title.substring(0, 64);
    if (body.length > 128) body = body.substring(0, 128);

    tapSnackbar(
      context: context,
      title: title,
      message: body,
      onTap: (x) {
        onTapMessage(message);
        x();
      },
    );
  }

  onTapMessage(message) async {
    // Handle the message here
    print("onTapMessage");
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
