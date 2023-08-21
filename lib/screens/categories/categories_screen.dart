import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/category_list';
  const CategoriesScreen({super.key, this.user});
  final User? user;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Categories"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              CategoryService.instance.showCreateDialog(
                context,
                success: (category) {
                  Navigator.pop(context);
                  CategoryService.instance.showUpdateDialog(context, category);
                },
              );
            },
          ),
        ],
      ),
      body: const CategoryListView(),
    );
  }
}
