import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController query = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("sqflite"),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextFormField(
            controller: query,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Type Query here... see output on consol"),
            maxLines: 10,
          )),
      floatingActionButton: FloatingActionButton(
        child: const Center(
            child: Align(alignment: Alignment.center, child: Text("Exe !"))),
        onPressed: () async {
          print("hello");

          var dir = await path.getApplicationDocumentsDirectory();
          String databsepath = dir.path + "mydatabase.db";
          Database database = await openDatabase(databsepath, version: 1,
              onCreate: (db, value) {
            print("creating a database");
            db.execute(
                'create table mytable("id" integer primary key autoincreament,"name" text,"salary" integer )');
          });
          print(dir.path);
//database.execute('create table mytable("id" integer primary key autoincrement,"name" text,"salary" integer )');
          print(
              await database.insert("mytable", {"name": "shiv", "salary": 22}));

//database.delete("mytable");
          //  database.update("mytable", {"name": "sachin", "salary": 30},
          //     where: 'id=?', whereArgs: [17]);
          database.execute(query.text);
          var data = await database.query("mytable");
          data.forEach((element) {
            print("row Value starts");
            element.forEach((key, value) {
              print("$key : $value");
            });
            print("row value ends");
          });
        },
      ),
    );
  }
}
