class PostModel {
  late String uId;
  late String name;
  late String profileImage;
  late String dateTime;
  late String post;
  late String postImage;

  PostModel(
      {required this.name,
      required this.uId,
      required this.profileImage,
      required this.dateTime,
      required this.post,
      required this.postImage});

  // بعمل constructor وبملاه من ال json الي تحت عشان الداتا تتحط في اماكنها
  PostModel.fromJason(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    profileImage = json['profileImage'];
    dateTime = json['date'];
    post = json['post'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uId': uId,
      'profileImage': profileImage,
      'date': dateTime,
      'post': post,
      'postImage': postImage,
    };
  }
}
