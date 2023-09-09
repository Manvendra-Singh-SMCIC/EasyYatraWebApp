import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_management_webapp/pages/home.dart';
import 'package:flutter_hotel_management_webapp/pages/hoteldetailpage.dart';
import 'package:flutter_hotel_management_webapp/pages/utilityShow.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../globals/global.dart';

class AuthController extends GetxController {
  //AuthController instance
  static AuthController instance = Get.find();
  //Email, password, name
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Global.loggedin = false;
    } else {
      Global.loggedin = true;
    }
    Get.offAll(() => const Home());
  }

  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      Global.loggedin = true;
      return await auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    Global.loggedin = false;
    await auth.signOut();
  }
}
