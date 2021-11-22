import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:Scaffold(appBar: AppBar(title:Text("Data Table")),body: MyApp(),)) );

}

class MyApp extends StatelessWidget {
  const MyApp() ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:DataTable(sortColumnIndex:1,sortAscending:false,
        columns:[
          DataColumn(label:Text("language")),
          DataColumn(label:Text("Likes")),
          DataColumn(label:Text("Mascat")),


        ], rows: [DataRow(cells:[
          DataCell(Text("Java")),
          DataCell(Text("6")),
          DataCell(Text("Duke")),
        ]),
        DataRow(cells:[
        DataCell(Text("Dart")),
    DataCell(Text("8")),
    DataCell(Text("Dash"))]),









        ]));
  }
}
