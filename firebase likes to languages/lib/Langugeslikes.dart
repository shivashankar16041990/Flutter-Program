import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'BuildUI.dart';
import "dart:io";
import 'function.dart';
class LangugesLike extends StatelessWidget{
  const LangugesLike();


  static Stream <QuerySnapshot> getStream()=>FirebaseFirestore.instance.collection('collection1').orderBy('likes').snapshots();



  @override
  Widget build(BuildContext context) {
getStream().listen((event) {event.docs.forEach((document) => debugPrint(document.toString())); });
    return StreamBuilder<QuerySnapshot>(stream: getStream(),
    builder: (context,collection1){
      if(collection1.hasError){
        return Text("error");

      }
      if(collection1.hasData)
        {
          final data=collection1.data;
          if(data!=null)
            {
              return ListView.builder(
              //  itemExtent: 10,
                itemCount: data.docs.length,
                itemBuilder: (context,index){
                  debugPrint("index is $index");

                  return BuildUI(data.docs[index]);
                },
              );
            }
          else
            {
              return Text("error");
            }
        }
    debugPrint("insideStream");
      return CircularProgressIndicator();


    },


    );



  }

}