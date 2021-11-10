import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/_socialLayout/edit_profile.dart';
import 'package:social_app/_socialLayout/social_cubit.dart';
import 'package:social_app/_socialLayout/social_states.dart';


class BuildProfile extends StatelessWidget {
  // final VoidCallback onClicked;
  //
  // const BuildProfile({Key key, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              children: [
                if (state is SocialUserUpdateLoadingState) SizedBox(height: 10),
                Container(
                  height: 185,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image(
                            height: 160,
                            width: double.infinity,
                            image: NetworkImage('${userModel.headerImage}'),
                            fit: BoxFit.fill),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: GestureDetector(
                          onTap: () {},
                          child: CircularProfileAvatar(
                            '${userModel.profileImage}',
                            radius: 65,
                            backgroundColor: Colors.transparent,
                            borderWidth: 4,
                            borderColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            imageFit: BoxFit.cover,
                            elevation: 5.0,
                            showInitialTextAbovePicture: false,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 150,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EditProfile(),
                                ));
                          },
                          child: const Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.deepOrangeAccent,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Text(
                      '${userModel.name}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${userModel.bio}',
                      style: Theme.of(context).textTheme.overline,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EditProfile(),
                              ));
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 18,
                        ),
                        label: Text('Edit Profile'),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
