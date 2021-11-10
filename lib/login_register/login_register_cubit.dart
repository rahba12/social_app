import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/login_register/login_register_states.dart';
import 'package:social_app/models/user_model.dart';

class SocialLoginAndRegisterCubit extends Cubit<SocialLoginAndRegisterStates> {
  SocialLoginAndRegisterCubit() : super(SocialLoginAndRegisterInitialStates());

  static SocialLoginAndRegisterCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingStates());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      emit(SocialLoginSuccessStates(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorStates(error.toString()));
    });
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(SocialRegisterLoadingStates());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        uId: value.user!.uid,
        email: email,
        isEmailVerified: null,
      );
      // emit(SocialRegisterSuccessStates());
    }).catchError((error) {
      emit(SocialRegisterErrorStates(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String uId,
    bool? isEmailVerified,
    String? phone,
    String? gender,
    String? headerImage,
    String? profileImage,
    String? bio,
  }) {
    emit(SocialCreateUserLoadingStates());

    SocialUserModel model = SocialUserModel(
      email: email,
      uId: uId,
      name: name,
      phone: phone.toString(),
      headerImage:
          'https://i.pinimg.com/564x/31/db/70/31db704a25c0b84bdc3d321684fa68e8.jpg',
      profileImage: profileImage.toString(),
      bio: bio.toString(),
      gender: gender.toString(),
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toJson())
        .then((value) {
      emit(SocialCreateUserSuccessStates());
    }).catchError((error) {
      emit(SocialCreateUserErrorStates(error.toString()));
    });
  }
}
