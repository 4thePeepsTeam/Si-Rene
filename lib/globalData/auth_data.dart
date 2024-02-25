import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

mixin UserData {
  // ignore: prefer_typing_uninitialized_variables
  static var userCredential;

  static bool isLoginSuccess() {
    return userCredential != null;
  }

  static bool firstTime = true;
  static String userRole = "";

  static Future <void> uploadDataIfFirstTime() async {
    if (userRole == "user") {
      await FirebaseFirestore.instance.collection("user").doc(userCredential.user.uid).get().then((value) async {
        if (!value.exists) {
          debugPrint("value not existed yet");
          firstTime = true;
        }
        else {
          firstTime = false;
        }
      }); 
    }
    else {
      await FirebaseFirestore.instance.collection("officer").doc(userCredential.user.uid).get().then((value) async {
        if (!value.exists) {
          debugPrint("value not existed yet");
          firstTime = true;
        }
        else {
          firstTime = false;
        }
      }); 
    }
  }

  static Future <dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch(e) {
      debugPrint("An error occurred $e");
    }

  }

  static Future <bool> signOutFromGoogle() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch(_) {
      return false;
    }
}
}