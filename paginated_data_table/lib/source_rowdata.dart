import 'package:flutter/material.dart';

class Source extends DataTableSource{

  static final values={"flutter":"Dash",
    "Java":"duke",
    "delphi":"helmet",
    "c":"dude",
    "c++":"owesome",
    "c#":"bread",
    "perl":"ruby",
    "html":"web"




  }.entries.toList();

  @override
  DataRow? getRow(int index) {
    final data=values[index];
    return DataRow(key:ValueKey(index.toString()),cells: [DataCell(Text(data.key)),DataCell(Text(data.value))]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => values.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount =>0;

}