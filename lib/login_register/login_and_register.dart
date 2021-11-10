import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/_socialLayout/social_layout.dart';
import 'package:social_app/login_register/screen_components.dart';
import 'package:social_app/login_register/login_register_cubit.dart';
import 'package:social_app/login_register/login_register_states.dart';
import 'package:social_app/shared/network/remote/cash_helper.dart';

class LoginAndRegister extends StatefulWidget {
  const LoginAndRegister({key}) : super(key: key);

  @override
  State<LoginAndRegister> createState() => _LoginAndRegisterState();
}

class _LoginAndRegisterState extends State<LoginAndRegister> {
  final formKey = GlobalKey<FormState>();
  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();

  bool isSignUpScreen = false;
  bool isMale = true;
  bool isRememberMe = false;
  bool _showLoginPassword = true;
  bool _showRegisterPassword = true;
  var userNameController = TextEditingController();
  var emailLoginController = TextEditingController();
  var passwordLoginController = TextEditingController();
  var emailRegisterController = TextEditingController();
  var passwordRegisterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => SocialLoginAndRegisterCubit(),
      child: BlocConsumer<SocialLoginAndRegisterCubit,
          SocialLoginAndRegisterStates>(
        listener: (BuildContext context, state) {
          if (state is SocialLoginSuccessStates) {
            Fluttertoast.showToast(
              msg: 'Login done Successfully',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16,
            );
            CashHelper.saveData(key: 'uId', value: state.uId).then((value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            });
          }
          if (state is SocialLoginErrorStates) {
            Fluttertoast.showToast(
              msg:
                  'There\'s an error in login, please check you information again',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16,
            );
          }
          if (state is SocialCreateUserSuccessStates) {
            Fluttertoast.showToast(
              msg: 'Sing Up done Successfully',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16,
            );
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Form(
                key: isSignUpScreen ? formKeyRegister : formKeyLogin,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'images/image.JPG',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(top: 120, left: 15),
                            // color: Color(0xFF95914C).withOpacity(.45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: isSignUpScreen
                                          ? 'Welcome to'
                                          : 'Welcome',
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFE57415),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: isSignUpScreen
                                              ? ' Cheeree'
                                              : ' Back',
                                          style: isSignUpScreen
                                              ? const TextStyle(
                                                  fontFamily: 'DancingScript',
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFE57415),
                                                )
                                              : const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFE57415),
                                                ),
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                isSignUpScreen
                                    ? const Text(
                                        '   Signup to continue',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2A2524),
                                        ),
                                      )
                                    : const Text(
                                        '   Login to continue',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2A2524),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      top: (height - 300) / 2,
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        height: isSignUpScreen ? 450 : 350,
                        width: width - 40,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSignUpScreen = false;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: !isSignUpScreen
                                              ? Colors.black
                                              : Colors.black45,
                                        ),
                                      ),
                                      if (!isSignUpScreen)
                                        Container(
                                          margin: const EdgeInsets.only(top: 2),
                                          width: 55,
                                          height: 2,
                                          color: const Color(0xFFE57415),
                                        ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSignUpScreen = true;
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'SIGNUP',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSignUpScreen
                                              ? Colors.black
                                              : Colors.black38,
                                        ),
                                      ),
                                      if (isSignUpScreen)
                                        Container(
                                          margin: const EdgeInsets.only(top: 2),
                                          width: 55,
                                          height: 2,
                                          color: const Color(0xFFE57415),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            if (isSignUpScreen) buildSingUpSelection(),
                            if (!isSignUpScreen) buildLoginSelection(),
                          ],
                        ),
                      ),
                    ),
                    if (isSignUpScreen)
                      Positioned(
                        top: 645,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: buildPressButton(
                            () {
                              if (formKeyRegister.currentState!.validate()) {
                                SocialLoginAndRegisterCubit.get(context)
                                    .userRegister(
                                  name: userNameController.text,
                                  email: emailRegisterController.text,
                                  password: passwordRegisterController.text,
                                );
                              }
                            },
                          ),
                        ),
                      )
                    else
                      Positioned(
                        top: 545,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: buildPressButton(
                            () {
                              if (formKeyLogin.currentState!.validate()) {
                                SocialLoginAndRegisterCubit.get(context)
                                    .userLogin(
                                        email: emailLoginController.text,
                                        password: passwordLoginController.text);
                              }
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildSingUpSelection() {
    return Column(
      children: [
        buildTextField(
          Typicons.user,
          'User Name',
          false,
          false,
          (value) {
            if (value!.isEmpty) {
              return 'User Name must not be empty';
            }
            return null;
          },
          null as IconButton,
          userNameController,
        ),
        buildTextField(
          Typicons.mail,
          'Email Address',
          false,
          true,
          (value) {
            if (value!.isEmpty) {
              return 'Email must not be empty';
            }
            return null;
          },
          null as IconButton,
          emailRegisterController,
        ),
        buildTextField(Typicons.lock, 'Password', _showRegisterPassword, false,
            (value) {
          if (value!.isEmpty) {
            return 'Password isn\'t correct';
          }
          return null;
        },
            IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _showRegisterPassword
                    ? Colors.grey
                    : const Color(0xFFE57415),
                size: 20,
              ),
              onPressed: () {
                setState(() => _showRegisterPassword = !_showRegisterPassword);
              },
            ),
            passwordRegisterController),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = true;
                });
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 10),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color: isMale ? const Color(0xFFE57415) : Colors.grey,
                        )),
                    child: Icon(
                      Icons.male_rounded,
                      color: isMale ? const Color(0xFFE57415) : Colors.grey,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'Male',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMale = false;
                });
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color:
                              !isMale ? const Color(0xFFE57415) : Colors.grey,
                        )),
                    child: Icon(
                      Icons.female_rounded,
                      color: !isMale ? const Color(0xFFE57415) : Colors.grey,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: 200,
          padding: const EdgeInsets.only(top: 15),
          child: RichText(
            textAlign: TextAlign.center,
            maxLines: 2,
            text: const TextSpan(
              text: 'By pressing submit you agree to our',
              style: TextStyle(
                height: 1.5,
                fontSize: 14,
                color: Colors.black54,
              ),
              children: [
                TextSpan(
                  text: ' terms & conditions',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFE57415),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginSelection() => Column(
        children: [
          buildTextField(Typicons.mail, 'Email Address', false, true, (value) {
            if (value!.isEmpty) {
              return 'Email must not be empty';
            }
            return null;
          }, null as IconButton, emailLoginController),
          buildTextField(Typicons.lock, 'Password', _showLoginPassword, false,
              (value) {
            if (value!.isEmpty) {
              return 'Password isn\'t correct';
            }
            return null;
          },
              IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: _showLoginPassword
                      ? Colors.grey
                      : const Color(0xFFE57415),
                  size: 20,
                ),
                onPressed: () {
                  setState(() => _showLoginPassword = !_showLoginPassword);
                },
              ),
              passwordLoginController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: const Color(0xFFE57415),
                      value: isRememberMe,
                      onChanged: (value) {
                        // if (uId != null) {
                        //   uId = CashHelper.getData(key: 'uId');}
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      }),
                  const Text(
                    'Remember Me',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              const Text(
                'Forget password?',
                style: TextStyle(
                  color: Color(0xFFE57415),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      );
}
