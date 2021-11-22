import 'package:flutter/material.dart';

class CurrentValue with ChangeNotifier
{
  int currentValue=0;
  void set_currentvalue(int value){
    currentValue=value;
    debugPrint("$currentValue");
    notifyListeners();

  }
}