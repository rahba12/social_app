
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            splashRadius: 15,
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
        title: const Text(
          'Add post',
        ),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  animationDuration: const Duration(seconds: 1),
                  backgroundColor: Colors.grey[100],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(letterSpacing: 2.2, fontSize: 14),
                ),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    primary: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Post',
                    style: TextStyle(letterSpacing: 2.2, fontSize: 14),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
