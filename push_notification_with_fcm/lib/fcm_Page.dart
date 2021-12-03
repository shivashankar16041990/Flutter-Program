import 'package:flutter/material.dart';
import 'Firebase_notification_model.dart';
class Fcm_Page extends StatelessWidget{
  FirebaseNotification notification;
   Fcm_Page( this.notification);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(child:Column( mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
  Text("Firebase Cloud Messaging"),
    Text("auther :  ${notification.auther}"),
    Text("route : ${notification.route}")


    ])));
  }

}