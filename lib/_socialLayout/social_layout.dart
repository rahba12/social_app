import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
//Flutter Icons
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:social_app/_socialLayout/social_cubit.dart';
import 'package:social_app/_socialLayout/social_states.dart';
import 'package:social_app/_socialLayout/tab_navigator.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentPage = "home";

  List<String> pageKeys = ["home", "chats", "users", "settings"];

  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "home": GlobalKey<NavigatorState>(),
    "chats": GlobalKey<NavigatorState>(),
    "users": GlobalKey<NavigatorState>(),
    "settings": GlobalKey<NavigatorState>(),
  };

  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = SocialCubit.get(context);

    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return WillPopScope(
            onWillPop: () async {
              final isFirstRouteInCurrentTab =
                  !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
              if (isFirstRouteInCurrentTab) {
                if (_currentPage != "home") {
                  _selectTab("home", 1);
                  return false;
                }
              }
              // let system handle back button if we're on the first route
              return isFirstRouteInCurrentTab;
            },
            child: Scaffold(
              body: Stack(children: <Widget>[
                _buildOffstageNavigator("home"),
                _buildOffstageNavigator("chats"),
                _buildOffstageNavigator("users"),
                _buildOffstageNavigator("settings"),
              ]),
              // body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
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
                currentIndex: _selectedIndex,
                onTap: (int index) {
                  _selectTab(pageKeys[index], index);
                },
              ),
            ));
      },
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
