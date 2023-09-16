import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class PostCardListScreen extends StatefulWidget {
  static const String routeName = '/PostCardList';
  const PostCardListScreen({super.key});

  @override
  State<PostCardListScreen> createState() => _PostCardListScreenState();
}

class _PostCardListScreenState extends State<PostCardListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostCardList'),
      ),
      body: PostListView(
        itemBuilder: (context, post) => PostCard(
          post: post,
          shareButtonBuilder: null,
        ),
      ),
    );
  }
}
