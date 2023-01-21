import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My App",
        theme: ThemeData.light(),
        home: Scaffold(body: MyList()));
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      debugPrint("    landscape");
      return GridView.count(
        crossAxisCount: 5,
        children: generate_listview(),
      );
    } else {
      debugPrint(" PORTRATE");
      return ListView(children: generate_listview());
    }
  }

  List<Widget> generate_listview() {
    List<Widget> list = List.empty(growable: true);
    for (int i = 0; i < 20; i++)
      list.add(Padding(
          padding: EdgeInsets.all(10),
          child: Center(
              child: ListTile(
                  title: Center(child: Text('item $i')),
                  tileColor: Colors.black26,
                  trailing: Icon(Icons.add_call)))));
    return list;
  }
}
