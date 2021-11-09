import 'package:flutter/material.dart';
import 'package:navigator_data_passing/routes.dart';
import "package:navigator_data_passing/widgets/todo class.dart";
import 'package:navigator_data_passing/widgets/details_of_list.dart';

class HomePage extends StatelessWidget
{
    HomePage();
 final List <Todo> todolist=[const  Todo("title 1","this is the title 1"),
   const Todo("title 2","this is the title 2"),
   const Todo("title 3","this is the title 3"),
   const Todo("title 4","this is the title 4")];
   void _itemPressed(BuildContext context,Todo item){
     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Details_of_List(item)));
   }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    ListView.builder(itemCount: todolist.length,
      itemBuilder: (context,value)
      {
        return ListTile(title:Text(todolist[value].title,textScaleFactor: 2 ),subtitle:Text(todolist[value].description,textScaleFactor: 2 ),

        onTap: (){_itemPressed(context,Todo(todolist[value].title,todolist[value].description));},

        );

      }
      ,)
    );





  }

}