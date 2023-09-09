import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hotel_management_webapp/auth/auth_controller.dart';
import 'package:flutter_hotel_management_webapp/globals/global.dart';
import 'package:flutter_hotel_management_webapp/utilityWidgets/hostproperty.dart';
import 'package:flutter_hotel_management_webapp/utils/constant.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _screenSize.width * 0.05,
              _screenSize.height * 0.01,
              _screenSize.width * 0.05,
              _screenSize.height * 0.01),
          child: Column(
            children: [
              _titleBar(_screenSize),
              Container(
                height: _screenSize.height * 0.8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                          fontFamily: 'Satoshi Variable',
                          fontSize: _screenSize.width * 0.024,
                          fontWeight: FontWeight.w700,
                          height: 1.19,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.012,
                      ),
                      Container(
                        width: _screenSize.width * 0.3,
                        child: AutoSizeText(
                          "Easyatra provides easy hotel bookings with great discounts and offers",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.012,
                      ),
                      Container(
                        width: _screenSize.width * 0.7,
                        padding: EdgeInsets.all(_screenSize.width * 0.02),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Color(0xFF000000).withOpacity(0.1),
                          )
                        ]),
                        child: Column(children: [
                          _input(_screenSize, email,
                              inputTitle: "Email Address"),
                          SizedBox(
                            height: _screenSize.height * 0.012,
                          ),
                          _input(_screenSize, password,
                              inputTitle: "Enter your Password"),
                          Container(
                            width: _screenSize.width * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: checkboxValue,
                                      onChanged: (e) {
                                        setState(() {
                                          checkboxValue = e!;
                                        });
                                      },
                                    ),
                                    Text("Remember me")
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Forgot password?")),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _screenSize.height * 0.012,
                          ),
                          TextButton(
                            style: ButtonStyle(backgroundColor:
                                MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.hovered))
                                return Colors.white;
                              else
                                return Colors.blue;
                            }), foregroundColor:
                                MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.hovered))
                                return Colors.blue;
                              else
                                return Colors.white;
                            })),
                            onPressed: () {
                              AuthController.instance.login(
                                  email.text.trim(), password.text.trim());
                            },
                            child: Container(
                                padding:
                                    EdgeInsets.all(_screenSize.width * 0.007),
                                width: _screenSize.width * 0.3,
                                child: Center(
                                  child: Text("Sign In",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: _screenSize.width * 0.013,
                                        fontWeight: FontWeight.w600,
                                        height: 1.75,
                                        letterSpacing: -0.2,
                                      )),
                                )),
                          ),
                          SizedBox(
                            height: _screenSize.height * 0.012,
                          ),
                          TextButton(
                            style: ButtonStyle(backgroundColor:
                                MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.hovered))
                                return Colors.blue;
                              else
                                return Colors.blueGrey.shade50;
                            }), foregroundColor:
                                MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.hovered))
                                return Colors.white;
                              else
                                return Colors.black;
                            })),
                            onPressed: () {
                              AuthController.instance.signInWithGoogle();
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.all(_screenSize.width * 0.007),
                              width: _screenSize.width * 0.3,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("images/google.png"),
                                    SizedBox(
                                      width: _screenSize.width * 0.01,
                                    ),
                                    Text(
                                      "Sign In with Google",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: _screenSize.width * 0.013,
                                        fontWeight: FontWeight.w600,
                                        height: 1.75,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _screenSize.height * 0.012,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Do you have an account? ",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: _screenSize.width * 0.01,
                                    height: 1.571,
                                  )),
                              GestureDetector(
                                onTap: () => Get.to(() => const SignUp()),
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: _screenSize.width * 0.01,
                                      height: 1.571,
                                      color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ]),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _input(Size _screenSize, TextEditingController controller,
      {required String inputTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _screenSize.width * 0.3,
          height: _screenSize.height * 0.06,
          decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              hintText: inputTitle,
            ),
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.02,
        )
      ],
    );
  }

  Column _titleBar(Size _screenSize) {
    ButtonStyle mainActionButtonsStyle = ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Set the border radius here
          ),
        ),
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) return Color(0xFF3D99EE);
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) return Colors.white;
          return Color(0xFF5E5E5E);
        }));
    TextStyle txtStyle = TextStyle(
      fontSize: _screenSize.width * 0.013,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 50,
              child: Image.asset('/images/Easyatra.png'),
            ),
            Container(
              width: _screenSize.width * 0.3,
              padding: EdgeInsets.only(right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        showPlatformDialog(
                            context: context,
                            builder: (_) => const HostProperty());
                      },
                      style: mainActionButtonsStyle,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(6, 9, 6, 9),
                        child: Text('Host your property', style: txtStyle),
                      )),
                  // Visibility(
                  //   visible: !Global.loggedin,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: Container(
                  //       padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                  //       child: Text('Log In', style: txtStyle),
                  //     ),
                  //     style: mainActionButtonsStyle,
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () {
                      !Global.loggedin
                          ? Get.to(() => const SignUp())
                          : AuthController.instance.logout();
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                      child: Text(!Global.loggedin ? 'Sign Up' : 'Logout',
                          style: txtStyle),
                    ),
                    style: mainActionButtonsStyle,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.03,
        )
      ],
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _screenSize.width * 0.05,
              _screenSize.height * 0.01,
              _screenSize.width * 0.05,
              _screenSize.height * 0.01),
          child: Column(
            children: [
              _titleBar(_screenSize),
              Container(
                width: 700,
                height: _screenSize.height * 0.8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create Free Account",
                        style: TextStyle(
                          fontFamily: 'Satoshi Variable',
                          fontSize: _screenSize.width * 0.024,
                          fontWeight: FontWeight.w700,
                          height: 1.19,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.012,
                      ),
                      Container(
                        width: _screenSize.width * 0.3,
                        child: AutoSizeText(
                          "Easyatra provides easy hotel bookings with great discounts and offers",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.012,
                      ),
                      Container(
                        width: _screenSize.width * 0.6,
                        padding: EdgeInsets.all(_screenSize.width * 0.02),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Color(0xFF000000).withOpacity(0.1),
                          )
                        ]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _input(_screenSize, name,
                                  inputTitle: "First & Last Name"),
                              SizedBox(
                                height: _screenSize.height * 0.012,
                              ),
                              _input(_screenSize, email,
                                  inputTitle: "Email Address"),
                              SizedBox(
                                height: _screenSize.height * 0.012,
                              ),
                              _input(_screenSize, password,
                                  inputTitle: "Create Password"),
                              Container(
                                width: _screenSize.width * 0.3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: checkboxValue,
                                          onChanged: (e) {
                                            setState(() {
                                              checkboxValue = e!;
                                            });
                                          },
                                          activeColor: checkboxValue
                                              ? Colors.blue
                                              : white,
                                        ),
                                        Text("I agree with"),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("Terms & Conditions")),
                                        Text("of Easyatra"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: _screenSize.height * 0.012,
                              ),
                              TextButton(
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.white;
                                  else
                                    return Colors.blue;
                                }), foregroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.blue;
                                  else
                                    return Colors.white;
                                })),
                                onPressed: () {
                                  if (email.text.isNotEmpty &&
                                      password.text.isNotEmpty &&
                                      name.text.isNotEmpty) {
                                    AuthController.instance.register(
                                        email.text.trim(),
                                        password.text.trim());
                                  } else {
                                    Get.snackbar("Error", "Enter all fields");
                                  }
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.all(_screenSize.width * 0.007),
                                  width: _screenSize.width * 0.3,
                                  child: Center(
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: _screenSize.width * 0.013,
                                        fontWeight: FontWeight.w600,
                                        height: 1.75,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _screenSize.height * 0.012,
                              ),
                              TextButton(
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.blue;
                                  else
                                    return Colors.blueGrey.shade50;
                                }), foregroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.white;
                                  else
                                    return Colors.black;
                                })),
                                onPressed: () {
                                  AuthController.instance.signInWithGoogle();
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.all(_screenSize.width * 0.007),
                                  width: _screenSize.width * 0.3,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("images/google.png"),
                                        SizedBox(
                                          width: _screenSize.width * 0.01,
                                        ),
                                        Text(
                                          "Sign Up with Google",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: _screenSize.width * 0.013,
                                            fontWeight: FontWeight.w600,
                                            height: 1.75,
                                            letterSpacing: -0.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: _screenSize.height * 0.012,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: _screenSize.width * 0.01,
                                      height: 1.571,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.to(() => const Login()),
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: _screenSize.width * 0.01,
                                        height: 1.571,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _input(Size _screenSize, TextEditingController controller,
      {required String inputTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _screenSize.width * 0.3,
          height: _screenSize.height * 0.06,
          decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              hintText: inputTitle,
            ),
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.02,
        )
      ],
    );
  }

  Column _titleBar(Size _screenSize) {
    ButtonStyle mainActionButtonsStyle = ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Set the border radius here
          ),
        ),
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) return Color(0xFF3D99EE);
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) return Colors.white;
          return Color(0xFF5E5E5E);
        }));
    TextStyle txtStyle = TextStyle(
      fontSize: _screenSize.width * 0.013,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 50,
              child: Image.asset('/images/Easyatra.png'),
            ),
            Container(
              width: _screenSize.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        showPlatformDialog(
                            context: context,
                            builder: (_) => const HostProperty());
                      },
                      style: mainActionButtonsStyle,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(6, 9, 6, 9),
                        child: Text('Host your property', style: txtStyle),
                      )),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const Login());
                    },
                    style: mainActionButtonsStyle,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                      child: Text('Log In', style: txtStyle),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Container(
                  //     padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                  //     child: Text('Sign Up', style: txtStyle),
                  //   ),
                  //   style: mainActionButtonsStyle,
                  // ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.03,
        )
      ],
    );
  }
}
