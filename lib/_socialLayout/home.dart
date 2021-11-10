import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:social_app/_socialLayout/post_screen.dart';
import 'package:social_app/_socialLayout/news_feed.dart';
import 'package:social_app/_socialLayout/profile.dart';
import 'package:social_app/_socialLayout/social_cubit.dart';
import 'package:social_app/_socialLayout/social_states.dart';

class SocialHomeScreen extends StatefulWidget {
  const SocialHomeScreen({key}) : super(key: key);

  @override
  State<SocialHomeScreen> createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen> {
  bool isFeedNews = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFeedNews = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'News Feed',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: !isFeedNews ? Colors.black : Colors.black45,
                          ),
                        ),
                        if (!isFeedNews)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            width: 55,
                            height: 2,
                            color: const Color(0xFFE57415),
                          ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFeedNews = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isFeedNews ? Colors.black : Colors.black38,
                          ),
                        ),
                        if (isFeedNews)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            width: 55,
                            height: 2,
                            color: const Color(0xFFE57415),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            mini: false,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            tooltip: 'new post',
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const PostScreen(),
                  ));
            },
            child:const  Icon(
              FontAwesome.edit,
              size: 22,
            ),
          ),
          body: Column(
            children: [

              !isFeedNews ? BuildNewsFeed() : BuildProfile(),
            ],
          ),
        );
      },
    );
  }
}
