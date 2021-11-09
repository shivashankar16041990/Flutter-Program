import 'package:flutter/material.dart';

void main()
{
 runApp(MaterialApp(theme:ThemeData.from(
     colorScheme: const ColorScheme.light()),

     home:const Scaffold(body: const DemoPage())))
;


}
class DemoPage extends StatefulWidget
{

  const DemoPage();
  @override
  State<StatefulWidget> createState() {
    return DemoPageState();

  }

}
class DemoPageState extends State<DemoPage>
{

  var counter=0;

void increament()
{
  setState(()=>
    counter++
  );
}

void decreament()
{
  setState(() {
    counter--;
  });
}
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
        top: 15.0),
    child:Row(
    children:[
      Expanded(
    child:  ElevatedButton
    (onPressed:increament,
    child: const Text ("+",textScaleFactor: 3),)),
    Expanded(
    child:Center( child: Text(counter.toString(),textScaleFactor: 3))),


     Expanded(
    child:  ElevatedButton
    (onPressed: (){decreament();},
    child: const Text ("-",textScaleFactor: 3,)))









    ]));



  }





}