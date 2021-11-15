import 'dart:collection';

import 'package:flutter/material.dart';

class SourceList with ChangeNotifier{
  final _mylist=List.generate(10, (index) => "Number $index");
  List<String> get values=>UnmodifiableListView(_mylist);
  void removeItem(int index)
  {
    _mylist.removeAt(index);
    notifyListeners();
  }


}