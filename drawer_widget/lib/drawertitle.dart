import 'package:flutter/material.dart';

class DrawerTitle extends StatelessWidget {
  final String text;

  const DrawerTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Text(
          text, style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),));
  }

}