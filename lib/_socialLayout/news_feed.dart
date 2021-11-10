import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:social_app/_socialLayout/social_cubit.dart';
import 'package:social_app/_socialLayout/social_states.dart';
import 'package:social_app/models/post_model.dart';

class BuildNewsFeed extends StatelessWidget {
  const BuildNewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: SocialCubit.get(context).posts.isNotEmpty,
              builder: (context) => Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) =>
                          buildNewsFeed(
                        SocialCubit.get(context).posts[index],
                        context,
                      ),
                      itemCount: SocialCubit.get(context).posts.length,
                    ),
                  ),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()));
        });
  }

  Widget buildNewsFeed(PostModel model, context) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 4,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    SocialCubit.get(context).userModel.profileImage),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: Theme.of(context).textTheme.button,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.dateTime,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(height: .7),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              IconButton(
                alignment: AlignmentDirectional.topEnd,
                iconSize: 22,
                splashRadius: 15,
                icon: const Icon(Icons.more_horiz_outlined),
                onPressed: () {},
                color: Theme.of(context).iconTheme.color,
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: Text(
              model.post,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (model.postImage != '')
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image(
                  height: 150,
                  width: double.infinity,
                  image: NetworkImage(model.postImage),
                  fit: BoxFit.cover),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Typicons.heart,
                          color: Colors.deepOrange,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '0',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(height: .7),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Typicons.comment,
                          color: Colors.deepOrange,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '0 comment',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(height: .7),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 3,
            thickness: 2,
            color: Theme.of(context).dividerColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 5),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              SocialCubit.get(context).userModel.profileImage),
                          radius: 15,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Write a comment ...',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(height: .7),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Typicons.heart,
                        color: Colors.deepOrange,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'like',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: .7),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
