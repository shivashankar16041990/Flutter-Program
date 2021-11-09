import 'package:flutter/material.dart';

void main()
{
  runApp(
      MaterialApp(
          title: "My App",
          debugShowCheckedModeBanner: false,
          home:Scaffold(
              body: getListView(),
            floatingActionButton:
            FloatingActionButton(
                child: Icon(Icons.add),
                tooltip: "add one more item",
                onPressed: (){debugPrint("FAB is clicked")
                ;
                }
                ),
          )
      )
  );
}

void showsnackbar(BuildContext context,String item)
{
  var snackbar=SnackBar(
    content: Text(" clicked on $item"),
    duration: Duration(seconds:2),
    action: SnackBarAction(onPressed: () { debugPrint("Performing dummy undo operation"); },
      label: 'UNDO',
    ),
  );


  ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
        onTap: (){showsnackbar(context,itemlist[index]);
        }
    );





  }
  );
  return listview;
}