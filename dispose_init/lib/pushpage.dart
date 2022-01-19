import 'package:flutter/material.dart';

class PushPage extends StatefulWidget {
  const PushPage();

  @override
  State<StatefulWidget> createState() {
    return PushPageState();
  }
}

class PushPageState extends State<PushPage> {
  void initState() {
    super.initState();
    print("init from PushPageState is called");
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
              },
            ),
            Text("This is pushed Page")
          ],
        ),
      ),
    );
  }

  void dispose() {
    print("dispose from PushPageState is called");

    super.dispose();
  }

  void DisplaySnack(BuildContext context, {required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }
}
