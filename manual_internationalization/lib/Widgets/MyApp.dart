import 'package:flutter/material.dart';
import '../../localization/localization.dart';
class MyApp extends StatelessWidget
{
  const MyApp();

  @override
  Widget build(BuildContext context) {
    debugPrint("from Myapp");
    return
    Scaffold(body:
        Text("${context.localize("hello")} \n ${context.localize("hello_world")} ", textScaleFactor: 5,));

  }


}