import 'package:flutter/material.dart';
import 'package:social_app/_socialLayout/chats.dart';
import 'package:social_app/_socialLayout/home.dart';
import 'package:social_app/_socialLayout/settings.dart';
import 'package:social_app/_socialLayout/users.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (tabItem == "home") {
      child = const SocialHomeScreen();
    } else if (tabItem == "chats") {
      child = const ChatsScreen();
    } else if (tabItem == "users") {
      child = const UsersScreen();
    } else if (tabItem == "settings") {
      child = const SocialSettingsScreen();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
