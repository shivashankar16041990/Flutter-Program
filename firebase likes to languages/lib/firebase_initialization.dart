import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Langugeslikes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'BuildUI.dart';

class MyAppInitialization extends StatefulWidget {
  const MyAppInitialization();

  @override
  State<StatefulWidget> createState() {
    return MyAppInitializationState();
  }
}

class MyAppInitializationState extends State<MyAppInitialization> {

  late final Future<FirebaseApp> _initialization;

  void initState()  {
    super.initState();
    _initialization = Firebase.initializeApp().whenComplete(() => debugPrint("initialization completed"));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      FutureBuilder<FirebaseApp>(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("error in initialization"));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(child: Text("Firebase connected successfully"));
            }
            return CircularProgressIndicator();
          }),

    ]));
  }
}
