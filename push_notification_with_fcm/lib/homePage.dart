import 'package:flutter/material.dart';
import 'package:push_notification_with_fcm/route.dart';
import 'Firebase_notification_model.dart';
import 'route.dart';
class HomePage extends StatelessWidget {
  const HomePage();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(children: [Text("Welcome to your App", textScaleFactor: 5),
        ElevatedButton(child: Text("push to open next route"),onPressed: (){
          //Navigator.of(context)?.pushNamed(RouteGenerator.fcm_Page);
          RouteGenerator.key.currentState?.pushNamed("fcm_Page",arguments:FirebaseNotification());

      },)]),
      appBar: AppBar(
          title: Text(
        "HomePage",
      )),
    );
  }

}
