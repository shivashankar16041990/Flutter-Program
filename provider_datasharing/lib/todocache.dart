import 'package:flutter/material.dart';

import 'todolist.dart';
class TodoCache
{
  int _index=-1;
final List<Todo> list=[const Todo('title 1', 'description 1'),
  const Todo('title 2', 'description 2'),
  const Todo('title 3', 'description 3'),
  const Todo('title 4', 'description 4'),
];
 TodoCache();
 int get index => _index;

 set index(int value)=> _index=value;



}