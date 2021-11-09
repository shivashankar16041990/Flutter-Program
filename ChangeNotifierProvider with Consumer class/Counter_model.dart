import 'package:flutter/material.dart';

class Counter_Model with ChangeNotifier{
  int _counter=0;
  int get counter=>_counter;
  void increament()
  {
    _counter++;
    notifyListeners();

  }
  void decrement()
  {
    _counter--;
    notifyListeners();

  }




}