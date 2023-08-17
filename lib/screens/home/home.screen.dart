import 'package:example/screens/chat/chat.room_list.screen.dart';
import 'package:example/screens/login/login.screen.dart';
import 'package:example/screens/menu/menu.screen.dart';
import 'package:example/screens/profile/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FriendScreen extends StatefulWidget {
  static const String routeName = '/';
  const FriendScreen({
    super.key,
  });

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              context.push(MenuScreen.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.comment),
            onPressed: () {
              context.push(LoginScreen.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.push(ProfileScreen.routeName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// 사용자 문서.
              UserDoc(
                builder: (user) {
                  return Column(
                    children: [
                      Text("Hello, ${user.displayName}! (uid: ${user.uid})"),
                      // Text(user.toString()),
                      ElevatedButton(
                        onPressed: UserService.instance.signOut,
                        child: const Text('Logout'),
                      ),
                      const SizedBox(height: 20),
                      UserProfileAvatar(
                        user: user,
                        size: 120,
                        upload: true,
                        delete: true,
                      ),
                      const SizedBox(height: 20),
                      UserAvatar(
                        user: user,
                        size: 60,
                      ),
                      const SizedBox(height: 20),
                      UserAvatar(
                        user: user,
                        size: 30,
                      ),
                      const SizedBox(height: 20),
                      StatefulBuilder(builder: (context, setState) {
                        final nameController = TextEditingController(text: user.name);
                        return Column(
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await UserService.instance.update(
                                  name: nameController.text,
                                );
                                setState(() {});
                              },
                              child: const Text("Update"),
                            ),
                            ElevatedButton(
                              onPressed: () => context.push(ChatRoomListScren.routeName),
                              child: const Text('Open EasyChat Room List'),
                            ),
                            ElevatedButton(
                              onPressed: () => context.push(ChatRoomListScren.routeName),
                              child: const Text('Open User List'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     /// Open the chat room screen with a chat room for the UI work and testing.
                                //     builder: (_) => ExampleChatRoomScreen(
                                //       /// Get the chat room from the firestore and pass it to the screen for the test.
                                //       room: ChatRoomModel.fromMap(
                                //         id: 'mFpHRSZLCemCfC2B9Y3B',
                                //         map: {
                                //           'name': 'Test Chat Room',
                                //           'group': true,
                                //           'open': false,
                                //           'users': [],
                                //           'master': '',
                                //         },
                                //       ),
                                //     ),
                                //   ),
                                // );
                              },
                              child: const Text('Open Example Chat Room'),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProfileScreen())),
                              child: const Text('Profile'),
                            ),
                            ElevatedButton(
                              onPressed: () => context.push(ChatRoomListScren.routeName),
                              child: const Text('Open Room List'),
                            ),
                            ElevatedButton(
                              onPressed: () => context.push(ChatRoomListScren.routeName),
                              child: const Text('TEST EasyChat'),
                            ),
                          ],
                        );
                      }),
                    ],
                  );
                },
                notLoggedInBuilder: () {
                  final auth = FirebaseAuth.instance;
                  final emailController = TextEditingController();
                  final passwordController = TextEditingController();
                  return Column(
                    children: [
                      const Text("Please, login"),
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await auth.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            child: const Text("Register"),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () async {
                              await auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                documentNotExistBuilder: () {
                  const str = "You are logged in, but your document does not exist. I am going to CREATE it !!";
                  UserService.instance.create();
                  return const Text(str);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
