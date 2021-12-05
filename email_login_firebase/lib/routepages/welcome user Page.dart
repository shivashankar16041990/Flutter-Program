import 'package:flutter/material.dart';
import "package:email_validator/email_validator.dart";
import 'package:provider/src/provider.dart';
import '../UserManagement.dart';
import 'package:email_login_firebase/route.dart';

class WelcomeUserPage extends StatelessWidget {
  const WelcomeUserPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("welcome user")),
        body:SingleChildScrollView(child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  "User name:${context.watch<User>().emailUser.email ?? "empty"}",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  "creadential:${context.watch<User>().userCredential.toString() ?? "empty"}",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ElevatedButton(
                  onPressed: () async{
                   await context.read<User>().SignOut();
                    ScaffoldMessenger.of(context).
                    showSnackBar
                      (
                        SnackBar
                          (
                            content: Text("you have Successfully signed out"
                            )
                        )
                    );
                   Navigator.of(context)?.pushNamed(
                       RouteGenerator.homePage
                   );
                  },
                  child: Text("sign out"),
                ),
              ),
            ]))));
  }
}
