import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class UserListScren extends StatefulWidget {
  static const String routeName = '/user_list';
  const UserListScren({super.key});

  @override
  State<UserListScren> createState() => _UserListScrenState();
}

class _UserListScrenState extends State<UserListScren> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: search,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  hintText: 'Enter user\'s display name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {});
                    },
                  )),
              onFieldSubmitted: (value) async {
                if (value.isNotEmpty) {
                  setState(() {});
                }
              },
            ),
          ),
          Expanded(
            child: UserListView(
              searchText: search.text,
              onTap: (user) async {
                // chat room
                ChatService.instance.showChatRoom(context: context, user: user);
              },
            ),
          ),
        ],
      ),
    );
  }
}
