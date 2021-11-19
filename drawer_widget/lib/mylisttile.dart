import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget{
 final  String title;
 final Icon icon_name;
  const MyListTile({required this.icon_name,required this.title});
  @override
  Widget build(BuildContext context) {
    return   ListTile(leading: icon_name,title:  Text(title),);
  }


}