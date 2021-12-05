import 'package:flutter/material.dart';
import "package:email_login_firebase/route.dart";
import 'package:firebase_auth/firebase_auth.dart';
class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user){if (user != null) {
      debugPrint("user is not null");

    } else {
      debugPrint("user is  null");
    }}
      );
  //  FirebaseAuth.instance.setPersistence(Persistence.NONE);
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          ElevatedButton(
              onPressed: () {

                Navigator.of(context)?.pushNamed(
                    RouteGenerator.signInPage
                );
              },
              child: Text("Sign in")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)?.pushNamed(
                    RouteGenerator.registerPage
                );
              },
              child: Text("Register")),
        ])));
  }
}
