import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatefulWidget {
  static const String routeName = '/post_list';
  const PostListScreen({
    super.key,
    this.categoryId,
  });

  final String? categoryId;

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  // final PostListViewController controller = PostListViewController();

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
        title: Text(widget.categoryId ?? "Post List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // PostService.instance.showCreatePostDialog(
              //   context,
              //   category: ca,
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
                if (UserService.instance.isAdmin)
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
      // body: FutureBuilder(
      //   future: CategoryService.instance.get(widget.categoryId!),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     // final Category category = ;
      //     // return PostListView(
      //     //   category: category,
      //     // );
      //   },
      // ),
    );
  }
}
