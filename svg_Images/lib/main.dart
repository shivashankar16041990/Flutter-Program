import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "launcher_icon/icon.svg",
            height: 200,
            width: 300,
          ),
          SvgPicture.network(
              "https://www.svgrepo.com/download/486346/camera.svg")
        ],
      ),
    ));
  }
}
