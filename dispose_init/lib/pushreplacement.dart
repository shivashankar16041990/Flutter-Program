import 'package:flutter/material.dart';

class PushPageReplacement extends StatefulWidget {
  const PushPageReplacement();

  @override
  State<StatefulWidget> createState() {
    return PushPageReplacementState();
  }
}

class PushPageReplacementState extends State<PushPageReplacement> {
  void initState() {
    super.initState();
    print("init from PushPageReplacementState is called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("back"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            Text("This is pushed Replacement Page")
          ],
        ),
      ),
    );
  }

  void dispose() {
    print("dispose from PushPageReplacementState is called");
  }

  void DisplaySnack(BuildContext context, {required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
