import 'package:example/screens/chat/chat.room_list.screen.dart';
import 'package:example/screens/forum/forum_list.screen.dart';
import 'package:example/screens/home/home.screen.dart';
import 'package:example/screens/login/login.screen.dart';
import 'package:example/screens/menu/menu.screen.dart';
import 'package:example/screens/forum/post_list.screen.dart';
import 'package:example/screens/profile/profile.screen.dart';
import 'package:example/screens/test/test.screen.dart';
import 'package:example/screens/user_list/user.list.screen.dart';
import 'package:go_router/go_router.dart';

import 'screens/categories/categories_screen.dart';
import 'screens/chat/open_rooms.screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: MenuScreen.routeName,
      builder: (context, state) => const MenuScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: ProfileScreen.routeName,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: ChatRoomListScren.routeName,
      builder: (context, state) => const ChatRoomListScren(),
    ),
    GoRoute(
      path: TestScreen.routeName,
      builder: (context, state) => const TestScreen(),
    ),
    GoRoute(
      path: UserListScren.routeName,
      builder: (context, state) => const UserListScren(),
    ),
    GoRoute(
      path: OpenRoomsScreen.routeName,
      builder: (context, state) => const OpenRoomsScreen(),
    ),
    GoRoute(
      path: CategoriesScreen.routeName,
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: PostListScreen.routeName,
      builder: (context, state) => PostListScreen(categoryId: (state.extra as Map)['categoryId'] as String?),
    ),
    GoRoute(
      path: ForumListScreen.routeName,
      builder: (context, state) => const ForumListScreen(),
    ),
  ],
);
