import 'package:flutter/cupertino.dart';

class SocialUserModel {
  late String uId;
  late String phone;
  late String name;
  late String email;
  late String profileImage;
  late bool isEmailVerified;
  late String bio;
  late String gender;
  late String headerImage;

  SocialUserModel(
      {required this.email,
        required this.phone,
        required this.name,
        required this.uId,
        required this.isEmailVerified,
        required this.profileImage,
        required this.bio,
        required this.gender,
        required this.headerImage});

  // بعمل constructor وبملاه من ال json الي تحت عشان الداتا تتحط في اماكنها
  SocialUserModel.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
    profileImage = json['profileImage'];
    bio = json['bio'];
    gender = json['gender'];
    headerImage = json['headerImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'name': name,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'profileImage': profileImage,
      'bio': bio,
      'gender': gender,
      'headerImage': headerImage,
    };
  }
}
