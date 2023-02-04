import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(
    localizationsDelegates: [
      DefaultCupertinoLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
      DefaultMaterialLocalizations.delegate
    ],
    home: CupertinoPageScaffold(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CupertinoButton(
      onPressed: () {
        _showCupertinoActionSheet(context);
      },
      child: Text("select "),
    ));
  }

  void _showCupertinoActionSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final size = MediaQuery.of(context).size.height;
          final panelheight = size == null ? 150 : size / 2.8;
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                height: panelheight as double,
                child: CupertinoActionSheet(
                  title: Text("select"),
                  actions: [
                    Text("my"),
                    Text("friend"),
                    CupertinoButton(
                      child: Text("button"),
                      onPressed: () {},
                      color: Colors.blue,
                    )
                  ],
                  cancelButton: CupertinoButton(
                    child: Text("cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.blue,
                  ),
                ))
          ]);
        });
  }
}
