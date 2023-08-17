import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class OpenRoomsScreen extends StatefulWidget {
  static const String routeName = '/open_room_list';
  const OpenRoomsScreen({super.key});

  @override
  State<OpenRoomsScreen> createState() => _OpenRoomsScreen();
}

class _OpenRoomsScreen extends State<OpenRoomsScreen> {
  final displayName = TextEditingController();
  final photoUrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Open Rooms'),
      ),
      body: const ChatRoomOpenListView(),
    );
  }
}
