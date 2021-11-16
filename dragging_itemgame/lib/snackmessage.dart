import 'package:flutter/material.dart';


mixin showSnackBar
{
  void showMessage(BuildContext context ,String msg){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(msg),duration: const Duration(milliseconds: 1600),));
  }
  
  
}