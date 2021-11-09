import 'package:flutter/material.dart';

void main()
{

  debugPrint(" from main()");
  runApp(
      MaterialApp(
              title: "Myapp",
              home:MyfavouriteCity()

  )
  );
}

class MyfavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    debugPrint(" from createState()");
    return _MyfavouriteCity();


  }
}


class _MyfavouriteCity extends State<MyfavouriteCity>

{

  String name ='';
  String name2="";
  var cities=["chennai","delhi","mumbai","hyderabad"];
  var _selectedcity="chennai";
  @override
  Widget build(BuildContext context) {

    debugPrint(" from build()");
    return Scaffold(
        appBar: AppBar(
        title:Text("My App")
        ),
        body: Container(
            margin:EdgeInsets.all(20),
            child:Column(
          children: <Widget>[
          TextField(onChanged: ((String userInput) {
            debugPrint(" from onChanged()");
            setState(() {
              debugPrint(" from setState()");
               name=userInput;

               });

            }
            )
          ),
           Padding (
               padding:EdgeInsets.all(20),
               child:Text("You have entered $name")),
    Padding (
        padding:EdgeInsets.all(20),
        child: TextField(
            onChanged:
            ((String item)
            {setState( (){ name2=item;}   );}))),
            Padding (padding:EdgeInsets.all(20),
                child:Text("you have entered $name2")
            ),
            DropdownButton<String> (value:_selectedcity,items: getitem(),





 onChanged: (selected){setState(() {
                this._selectedcity=selected.toString();
             });},)
          ]
    )
    )
    );
  }





  List<DropdownMenuItem<String>> getitem()

  {

    List<DropdownMenuItem<String>> dropdownmenuitem=List.empty(growable: true);
    for (var city in cities)
      {
        dropdownmenuitem.add(DropdownMenuItem(child:Text("city"),value:city));
      }
      return dropdownmenuitem;



  }




}