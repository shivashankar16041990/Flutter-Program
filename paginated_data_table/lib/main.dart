

import 'package:flutter/material.dart';
import 'source_rowdata.dart';
void main() {
  runApp(MaterialApp(home:Scaffold(appBar: AppBar(title:Text("Data Table")),body: MyApp(),)) );

}

class MyApp extends StatelessWidget {
  const MyApp() ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:

    PaginatedDataTable(rowsPerPage:3,
      header:Text("Info"),sortColumnIndex:1,sortAscending:false,
        columns:[
          DataColumn(label:Text("language")),
          DataColumn(label:Text("Likes")),



        ],
    source: Source(),




    ));
  }
}
