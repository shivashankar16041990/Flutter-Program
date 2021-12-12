import 'package:flutter/material.dart';
import 'user_class.dart';

class WelcomePage extends StatelessWidget {
  User user;

  WelcomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("welcome")),
      body: Text("welcome \n ${user.name} \n with ${user.password}"),
    );
  }
}
