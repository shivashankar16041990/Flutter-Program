import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'abstract_userRepository.dart';

class User with ChangeNotifier {
  late  EmailUser emailUser;
  late  UserCredential userCredential;

  Future<void> userSignin(String email, String password) async {
    try {
      debugPrint("before user signin");
     // debugPrint("emailUser :${emailUser.email?? "empty" }");
     // debugPrint("userCredential :${userCredential.additionalUserInfo.toString()?? "empty" }");
      emailUser = EmailUser(email: email, password: password);
      userCredential = await emailUser.SignIn();
      debugPrint("after user signin");
      debugPrint("emailUser :${emailUser.email?? "empty" }");
      debugPrint("userCredential :${userCredential.additionalUserInfo.toString()?? "empty" }");
      notifyListeners();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint("weak password");
      }
      if (e.code == 'email-already-in-use') {
        debugPrint("E mail already in use");
      }
    } catch (e) {
      debugPrint("OOps Something went wrong");
    }
  }

  Future<void> sendmail() async {
    debugPrint("emailsent");
    await userCredential.user?.sendEmailVerification();
    notifyListeners();
  }

  Future<bool?> vadidateCode() async {
    if(userCredential.user!=null){
    if(userCredential.user!.emailVerified){

      debugPrint("email verified");
      return true;
    }}
    else {
      debugPrint("email not verified");
      return false;

    }
  }

  Future<void> UserRegister(String email, String password) async {
    debugPrint("before user userRegistration");
    //debugPrint("emailUser :${emailUser.email.isEmpty? "empty":emailUser.email }");
    //debugPrint("userCredential :${userCredential.additionalUserInfo.toString()?? "empty" }");
    emailUser = EmailUser(email: email, password: password);
    userCredential = await emailUser.Register();

    debugPrint("after user userRegistration");
    debugPrint("emailUser :${emailUser.email?? "empty" }");
    debugPrint("userCredential :${userCredential.additionalUserInfo.toString()?? "empty" }");
    notifyListeners();
  }

  Future<bool> SignOut() async {
    await emailUser.SignOut();
    return true;
  }
}
