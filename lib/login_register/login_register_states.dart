abstract class SocialLoginAndRegisterStates {}

class SocialLoginAndRegisterInitialStates extends SocialLoginAndRegisterStates {
}

class SocialLoginLoadingStates extends SocialLoginAndRegisterStates {}

class SocialLoginSuccessStates extends SocialLoginAndRegisterStates {
  final String uId;

  SocialLoginSuccessStates(this.uId);
}

class SocialLoginErrorStates extends SocialLoginAndRegisterStates {
  final String error;
  SocialLoginErrorStates(this.error);
}

class SocialRegisterLoadingStates extends SocialLoginAndRegisterStates {}

class SocialRegisterSuccessStates extends SocialLoginAndRegisterStates {}

class SocialRegisterErrorStates extends SocialLoginAndRegisterStates {
  final String error;
  SocialRegisterErrorStates(this.error);
}

class SocialCreateUserLoadingStates extends SocialLoginAndRegisterStates {}

class SocialCreateUserSuccessStates extends SocialLoginAndRegisterStates {}

class SocialCreateUserErrorStates extends SocialLoginAndRegisterStates {
  final String error;
  SocialCreateUserErrorStates(this.error);
}
