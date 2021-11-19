import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier{
   int index=1;
  void set_index(int value){
    index=value;
    notifyListeners();
    debugPrint("value is updated $value");
  }
  int get_index()
  {
    return index;
  }

}