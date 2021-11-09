import 'package:flutter/material.dart';

void main()
{
  runApp(
      MaterialApp(
          title: "My App",
          debugShowCheckedModeBanner: false,
          home:Scaffold(
            body: getListView()
    )
      )
  );
}




List <String> getListelement()
{
  var itemlist=List<String>.generate(1000,(counter) =>"Item $counter");
  return itemlist;

}



Widget getListView()
{

  var itemlist=getListelement();
var listview=ListView.builder(itemBuilder: (context,index){

  return ListTile(
      title: Text(
          itemlist[index]),
      leading:Icon(Icons.arrow_forward_ios),
      onTap: (){debugPrint("${itemlist[index]} is tapped");
      }
      );





}
);
return listview;
}