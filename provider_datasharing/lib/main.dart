import 'dart:convert';

import 'package:flutter/material.dart';
import 'todolist.dart';
import 'todocache.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

void main()

{
  runApp(Provider<TodoCache>(create:(_)=> TodoCache() ,
      child:const MyApp()));
}
class MyApp extends StatelessWidget
{
  const MyApp();
  @override
  Widget build(BuildContext context) {
      return  const MaterialApp(home:const ListViewPage()
      );
  }

}

class ListViewPage  extends StatelessWidget{
const ListViewPage();
  @override
  Widget build(BuildContext context) {

    var  todo=Provider.of<TodoCache>(context);
    developer.log("checking todo",name:"todo");



    return Scaffold(
        body:  ListView.builder(
            itemBuilder:
                (_,index)
            {
               return ListTile(
                 title:Text(
                     todo.list[index].title)
                 ,subtitle:Text(
                  todo.list[index].description),
                 onTap: (){ 

                   Provider.of<TodoCache>(context,listen:false).index=index;
                 Navigator.push(context,  MaterialPageRoute(
                            builder: (BuildContext context) => const PageDetails()));

                 
                 },


               );


            },


            itemCount: Provider.of<TodoCache>(context).list.length

        )
    );


  }



}


class PageDetails extends StatelessWidget{
  const PageDetails();
  @override
  Widget build(BuildContext context) {
   return  Scaffold(body: Consumer<TodoCache>(
   builder: (context,todo,_){
     return Center(child:Text(" ${todo.list[todo.index].title}\n"
         ""
         ""
         "${todo.list[todo.index].description} ",textScaleFactor: 3,));
   }));
  }



}
