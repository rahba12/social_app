import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:social_app/_socialLayout/chats.dart';
import 'package:social_app/_socialLayout/home.dart';
import 'package:social_app/_socialLayout/settings.dart';
import 'package:social_app/_socialLayout/users.dart';

class NormalBottomNavBar extends StatefulWidget {
  const NormalBottomNavBar({Key? key}) : super(key: key);

  @override
  NormalBottomNavBarState createState() => NormalBottomNavBarState();
}

class NormalBottomNavBarState extends State<NormalBottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    const SocialHomeScreen(),
    const ChatsScreen(),
    const UsersScreen(),
    const SocialSettingsScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome5.home,
              size: 22,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome5.comment_dots,
              size: 22,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome5.users,
              size: 22,
            ),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.cog,
              size: 22,
            ),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
