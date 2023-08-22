import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

/// TODO give example of making own using route
class ForumListScreen extends StatefulWidget {
  static const String routeName = '/forum_list';
  const ForumListScreen({
    super.key,
    this.user,
    // required this.category,
  });
  final User? user;
  // final Category category;

  @override
  State<ForumListScreen> createState() => _ForumListScreenState();
}

class _ForumListScreenState extends State<ForumListScreen> {
  // final ForumListViewController controller = ForumListViewController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // if (widget.user != null) {
      //   controller.showPost(context: context, user: widget.user);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Forums"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // PostService.instance.showCreatePostDialog(
              //   // TODO category
              //   context,
              //   success: (val) {
              //     Navigator.pop(context);
              //   },
              // );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.settings),
            itemBuilder: (context) {
              return [
                // TODO is this official way to check if Admin?
                // if (UserService.instance.isAdmin)
                const PopupMenuItem(
                  value: "category",
                  child: Text("Category Settings"),
                ),
                const PopupMenuItem(
                  value: "adjust_text_size",
                  child: Text("Adjust text size"),
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case "category":
                  CategoryService.instance.showListDialog(context);
                  break;
                case "adjust_te":
                  // context.push('/adjust_text_size');
                  break;
              }
            },
          )
        ],
      ),
      body: const CategoryListView(
          // controller: controller,
          ),
    );
  }
}
