import 'package:flutter/material.dart';
import'dart:math';

class randomPage extends StatelessWidget
{
  const randomPage();
  @override
  Widget build(BuildContext context) {
    return

  Scaffold(body: Center(child: Text("${Random().nextInt(50)}"),),);
  }

}