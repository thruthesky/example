import 'package:example/screens/chat/chat.room_list.screen.dart';
import 'package:example/screens/home/home.screen.dart';
import 'package:example/screens/login/login.screen.dart';
import 'package:example/screens/menu/menu.screen.dart';
import 'package:example/screens/profile/profile.screen.dart';
import 'package:example/screens/test/test.screen.dart';
import 'package:go_router/go_router.dart';

import 'screens/chat/open_rooms.screen.dart';

final router = GoRouter(
  // initialLocation: '/',
  routes: [
    GoRoute(
      path: FriendScreen.routeName,
      builder: (context, state) => const FriendScreen(),
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
      path: OpenRoomsScreen.routeName,
      builder: (context, state) => const OpenRoomsScreen(),
    ),
  ],
);
