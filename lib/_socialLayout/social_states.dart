abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialGetUserDataLoadingState extends SocialStates {}

class SocialGetUserDataSuccessState extends SocialStates {}

class SocialGetUserDataErrorState extends SocialStates {
  final String error;
  SocialGetUserDataErrorState(this.error);
}

// class ChangeBottomNavBarState extends SocialStates {}

// pick profile image
class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

// pick header image
class SocialHeaderImagePickedSuccessState extends SocialStates {}

class SocialHeaderImagePickedErrorState extends SocialStates {}

// upload profile image
class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageErrorState extends SocialStates {}

// upload header image
class SocialUploadHeaderImageSuccessState extends SocialStates {}

class SocialUploadHeaderImageErrorState extends SocialStates {}

// update user
class SocialUserUpdateLoadingState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {}

// create post
class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostErrorState extends SocialStates {}

// pick post image
class SocialPostImagePickedSuccessState extends SocialStates {}

class SocialPostImagePickedErrorState extends SocialStates {}

// upload post image image
class SocialUploadPostImageLoadingState extends SocialStates {}

class SocialUploadPostImageSuccessState extends SocialStates {}

class SocialUploadPostImageErrorState extends SocialStates {}

//remove post image
class SocialRemovedPostImageState extends SocialStates {}

// get posts in feed
class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates {
  final String error;
  SocialGetPostsErrorState(this.error);
}
