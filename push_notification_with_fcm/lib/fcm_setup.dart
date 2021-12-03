import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_with_fcm/Firebase_notification_model.dart';
import 'route.dart';

class FirebasePushManager{
  FirebasePushManager._();
  static final _instance=FirebasePushManager._();
  factory FirebasePushManager()=>_instance;
  static bool _initialized=false;
  static Future <void>  init() async{

    if(!_initialized){
      final firebasemessage=FirebaseMessaging.instance;
      await firebasemessage.requestPermission();

     FirebaseMessaging.onMessage.listen(_showAlert);
     FirebaseMessaging.onBackgroundMessage(_navigatetoRoute);
     FirebaseMessaging.onMessageOpenedApp.listen(_showAlert );
     _initialized=true;



    }
  }


  static void _showAlert(RemoteMessage remoteMessage){
    debugPrint("notification sent by ${remoteMessage.data["auther"] as String}");
    final map =remoteMessage.data;
    final routename=map["route"] as String;
    final auther=map["auther"] as String;
    RouteGenerator.key.currentState?.pushNamed(routename,arguments: FirebaseNotification(route: routename,auther: auther));

  }
  static Future<void> _navigatetoRoute(RemoteMessage remoteMessage) async{
    final map =remoteMessage.data;
    final routename=map["route"] as String;
    final auther=map["auther"] as String;
    RouteGenerator.key.currentState?.pushNamed(routename,arguments: FirebaseNotification(route: routename,auther: auther) as FirebaseNotification );
  }



}