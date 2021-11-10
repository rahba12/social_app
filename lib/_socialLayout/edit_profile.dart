import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:social_app/_socialLayout/social_cubit.dart';
import 'package:social_app/_socialLayout/social_states.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // bool _showPassword = true;
  // bool _showConfirmPassword = true;
  // var passwordController = TextEditingController();
  // var confirmPasswordController = TextEditingController();

  var phoneController = TextEditingController();
  var userNameController = TextEditingController();
  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var headerImage = SocialCubit.get(context).headerImage;

        // get data from firebase
        userNameController.text = userModel.name;
        bioController.text = userModel.bio;
        phoneController.text = userModel.phone;

        return Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).appBarTheme.iconTheme,
            actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
            elevation: .3,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                splashRadius: 15,
                icon: const Icon(
                  Icons.arrow_back_ios,
                )),
            // centerTitle: true,
            title: Text(
              'Edit Profile',
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  splashRadius: 15,
                  icon: const Icon(
                    FontAwesome.cog,
                  ))
            ],
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 185,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image(
                                  height: 160,
                                  width: double.infinity,
                                  image: headerImage == null
                                      ? NetworkImage('${userModel.headerImage}')
                                      : FileImage(headerImage) as ImageProvider,
                                  fit: BoxFit.fill),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: IconButton(
                                splashRadius: 25,
                                icon: const CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.deepOrangeAccent,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                onPressed: () {
                                  SocialCubit.get(context).pickHeaderImage();
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: profileImage == null
                                        ? NetworkImage(
                                            '${userModel.profileImage}')
                                        : FileImage(profileImage)
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: (width - 20) / 2,
                              child: IconButton(
                                splashRadius: 25,
                                icon: const CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.deepOrangeAccent,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                onPressed: () {
                                  SocialCubit.get(context).pickProfileImage();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  if (SocialCubit.get(context).profileImage != null ||
                      SocialCubit.get(context).headerImage != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (SocialCubit.get(context).profileImage != null)
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              animationDuration: const Duration(seconds: 1),
                              backgroundColor: Colors.grey[100],
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                            ),
                            onPressed: () {
                              SocialCubit.get(context).uploadProfileImage(
                                name: userNameController.text,
                                phone: phoneController.text,
                                bio: bioController.text,
                              );
                            },
                            child: const Text(
                              'Update profile image',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        if (SocialCubit.get(context).headerImage != null)
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                primary: Colors.white,
                                backgroundColor: Colors.deepOrangeAccent,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              onPressed: () {
                                SocialCubit.get(context).uploadHeaderImage(
                                  name: userNameController.text,
                                  phone: phoneController.text,
                                  bio: bioController.text,
                                );
                              },
                              child: const Text(
                                'Update header image',
                                style: TextStyle(fontSize: 14),
                              )),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextField(Typicons.user, 'Username', false, false,
                      userNameController),
                  // buildTextField(
                  //     Typicons.mail, 'Email Address', false, true, null, null),
                  // buildTextField(
                  //     Typicons.lock,
                  //     'Password',
                  //     _showPassword,
                  //     false,
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.remove_red_eye,
                  //         color: this._showPassword
                  //             ? Colors.grey
                  //             : Color(0xFFE57415),
                  //         size: 20,
                  //       ),
                  //       onPressed: () {
                  //         setState(
                  //             () => this._showPassword = !this._showPassword);
                  //       },
                  //     ),
                  //     passwordController),
                  // buildTextField(
                  //     Typicons.lock,
                  //     'Confirm Password',
                  //     _showConfirmPassword,
                  //     false,
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.remove_red_eye,
                  //         color: this._showConfirmPassword
                  //             ? Colors.grey
                  //             : Color(0xFFE57415),
                  //         size: 20,
                  //       ),
                  //       onPressed: () {
                  //         setState(() => this._showConfirmPassword =
                  //             !this._showConfirmPassword);
                  //       },
                  //     ),
                  //     confirmPasswordController),
                  buildTextField(
                      Typicons.doc_text, 'Bio', false, false, bioController),
                  buildTextField(Typicons.phone_outline, 'phone number', false,
                      false, phoneController),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          animationDuration: const Duration(seconds: 1),
                          backgroundColor: Colors.grey[100],
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          onPressed: () {
                            SocialCubit.get(context).updateUser(
                                name: userNameController.text,
                                phone: phoneController.text,
                                bio: bioController.text);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(letterSpacing: 2.2, fontSize: 14),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    // IconButton suffixButton,
    TextEditingController controller,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(
              icon,
              size: 18,
              color: Theme.of(context).iconTheme.color,
            ),
            // suffixIcon: suffixButton,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      );
}
