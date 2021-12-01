import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "dart:io";
class BuildUI extends StatelessWidget {
  late String name;
  late int likes;
  late String image;
  QueryDocumentSnapshot _snapshot;

  BuildUI(this._snapshot) {
    name = _snapshot.get('name') as String;
    likes = _snapshot.get('likes') as int;
    image = _snapshot.get('image') as String;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("$name, $likes, $image ");

    return ListTile(
      leading: Image.asset("asset/$image.png", ),
      title: Text(name,textScaleFactor: 2,),
      subtitle: Text("Total likes $likes",),
      trailing: IconButton(
          icon: Icon(Icons.thumb_up), onPressed: _updatevote),);
  }

  void _updatevote(){
    FirebaseFirestore.instance.runTransaction((transaction) async{
     final secureSnapshot=await transaction.get(_snapshot.reference);
    final int currentLikes=secureSnapshot.get('likes') as int;
    transaction.update(secureSnapshot.reference, {
      "likes":currentLikes+1
    });
    });


  }
}