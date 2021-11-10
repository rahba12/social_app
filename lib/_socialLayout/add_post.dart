import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/_socialLayout/social_cubit.dart';
import 'package:social_app/_socialLayout/social_states.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  var postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var userModel = SocialCubit.get(context).userModel;
          return Scaffold(
            appBar: AppBar(
                iconTheme: Theme.of(context).appBarTheme.iconTheme,
                actionsIconTheme:
                    Theme.of(context).appBarTheme.actionsIconTheme,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    splashRadius: 15,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    )),
                title: const Text(
                  'Create post',
                ),
                titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
                actions: [
                  TextButton(
                    child: const Text(
                      'Post',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepOrangeAccent),
                    ),
                    onPressed: () {
                      var now = DateTime.now();
                      if (SocialCubit.get(context).postImage == null) {
                        SocialCubit.get(context).createPost(
                          dateTime: now.toString(),
                          post: postController.text,
                        );
                      } else {
                        SocialCubit.get(context).uploadPostImage(
                            dateTime: now.toString(),
                            post: postController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          userModel.profileImage,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: TextField(
                            controller: postController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end,
                            maxLines: 5,
                            decoration: const InputDecoration(
                              hintText: '... what\'s in your mind',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (SocialCubit.get(context).postImage != null)
                    SizedBox(
                      height: 185,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Image(
                                height: 160,
                                width: double.infinity,
                                image: FileImage(
                                    SocialCubit.get(context).postImage),
                                fit: BoxFit.cover),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: IconButton(
                              onPressed: () {
                                SocialCubit.get(context).removePostImage();
                              },
                              splashRadius: 25,
                              icon: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Spacer(),
                  Divider(
                    height: 2,
                    thickness: .5,
                    color: Theme.of(context).dividerColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            SocialCubit.get(context).pickPostImage();
                          },
                          icon: Icon(Icons.camera_alt_outlined),
                          label: Text('Add Photo')),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.video_call_rounded),
                          label: Text('Add video')),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: .5,
                    color: Theme.of(context).dividerColor,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
