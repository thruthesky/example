import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  static const String routeName = '/post_list';
  const PostsScreen({super.key, this.user});
  final User? user;

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
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
        ],
      ),
      body: PostListView(
          // controller: controller,
          ),
    );
  }
}
