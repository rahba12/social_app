import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_app/_socialLayout/Home.dart';
import 'package:social_app/_socialLayout/settings.dart';
import 'package:social_app/_socialLayout/chats.dart';
import 'package:social_app/_socialLayout/social_states.dart';
import 'package:social_app/_socialLayout/users.dart';

import 'package:social_app/models/post_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/shared/components/constance.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  late SocialUserModel userModel;

  void getUserData() {
    emit(SocialGetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel =
          SocialUserModel.fromJason(value.data() as Map<String, dynamic>);
      emit(SocialGetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserDataErrorState(error.toString()));
    });
  }

  // how to pick profile photo from mobile
  final ImagePicker _picker = ImagePicker();
  late File profileImage;
  Future pickProfileImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      // print(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      // print('no image selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  //how to pick header photo from mobile
  late File headerImage;
  Future pickHeaderImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      headerImage = File(pickedFile.path);
      emit(SocialHeaderImagePickedSuccessState());
    } else {
      emit(SocialHeaderImagePickedErrorState());
    }
  }

// how to upload profile photo to firebase storage
  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          profileImage: value,
        );
        emit(SocialUploadProfileImageSuccessState());
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  // how to upload header photo to firebase storage
  void uploadHeaderImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(headerImage.path).pathSegments.last}')
        .putFile(headerImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          headerImage: value,
        );
        emit(SocialUploadHeaderImageSuccessState());
      }).catchError((error) {
        emit(SocialUploadHeaderImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadHeaderImageErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? headerImage,
    String? profileImage,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel.email,
      headerImage: headerImage ?? userModel.headerImage,
      profileImage: profileImage ?? userModel.profileImage,
      uId: userModel.uId,
      isEmailVerified: false,
      gender: '',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toJson())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }

  // how to pick post image
  late File postImage;
  Future pickPostImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    } else {
      print('no image selected');
      emit(SocialPostImagePickedErrorState());
    }
  }

  // how to upload post Image
  void uploadPostImage({
    required String dateTime,
    required String post,
  }) {
    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(
          dateTime: dateTime,
          post: post,
          postImage: value,
        );
        emit(SocialCreatePostSuccessState());
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  // how to remove post Image
  void removePostImage() {
    postImage = null as File;
    emit(SocialRemovedPostImageState());
  }

  // how to create post
  void createPost({
    required String dateTime,
    required String post,
    String? postImage,
  }) {
    emit(SocialCreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel.name,
      profileImage: userModel.profileImage,
      uId: userModel.uId,
      dateTime: dateTime,
      post: post,
      postImage: postImage ?? '',
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toJson())
        .then((value) {
      emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  // to to get posts
  List<PostModel> posts = [];
  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      for (var element in value.docs) {
        posts.add(PostModel.fromJason(element.data()));
      }
      emit(SocialGetPostsSuccessState());
    }).catchError((error) {
      emit(SocialGetPostsErrorState(error.toString()));
    });
  }
}
