import 'package:flutter/material.dart';
import 'package:navigator_data_passing/widgets/todo class.dart';

class Details_of_List extends StatelessWidget
{
  final Todo item;
  const Details_of_List(this.item);


  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Center(child:Text("${item.title}\n${item.description}",textScaleFactor: 4,)));
;


  }




}
