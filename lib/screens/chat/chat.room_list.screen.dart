import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatRoomListScren extends StatefulWidget {
  static const String routeName = '/chat_room_list';
  const ChatRoomListScren({super.key, this.user});
  final UserModel? user;

  @override
  State<ChatRoomListScren> createState() => _ChatRoomListScrenState();
}

class _ChatRoomListScrenState extends State<ChatRoomListScren> {
  final ChatRoomListViewController controller = ChatRoomListViewController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.user != null) {
        controller.showChatRoom(context: context, user: widget.user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chat Room List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ChatService.instance.showCreateChatRoomDialog(
                context,
                success: (room) {
                  context.pop();
                  controller.showChatRoom(context: context, room: room);
                },
                cancel: () {
                  context.pop();
                },
              );
            },
          ),
        ],
      ),
      body: ChatRoomListView(
        controller: controller,
      ),
    );
  }
}
