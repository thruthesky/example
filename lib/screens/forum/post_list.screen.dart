import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatefulWidget {
  static const String routeName = '/post_list';
  const PostListScreen({super.key, this.user});
  final User? user;

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
        title: const Text("Posts"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              PostService.instance.showCreatePostDialog(
                context,
                success: (val) {
                  Navigator.pop(context);
                },
              );
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.settings),
            itemBuilder: (context) {
              return [
                if (UserService.instance.isAdmin)
                  const PopupMenuItem(
                    value: "category",
                    child: Text("Categories"),
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
                  showGeneralDialog(
                      context: context,
                      pageBuilder: (_, __, ___) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text('Category'),
                            actions: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  CategoryService.instance.showCreateCategoryDialog(
                                    context,
                                    success: (val) {
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          body: const CategoryListView(),
                        );
                      });
                  break;
                case "adjust_te":
                  // context.push('/adjust_text_size');
                  break;
              }
            },
          )
        ],
      ),
      body: const PostListView(
          // controller: controller,
          ),
    );
  }
}
