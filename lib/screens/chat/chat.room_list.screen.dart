import 'package:flutter/material.dart';

class ChatRoomListScren extends StatelessWidget {
  static const String routeName = '/chat_room_list';
  const ChatRoomListScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chat Room List"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Chat Room List',
            ),
          ],
        ),
      ),
    );
  }
}
