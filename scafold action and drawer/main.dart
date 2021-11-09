import 'package:flutter/material.dart';

void main(){


  runApp(Myapp());

}
class Myapp extends StatelessWidget
{
  const Myapp();

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "MyApp",
     home: Scaffold(
         drawer:Drawer(
             child:ListView(
                 children: <Widget>[
                   ListTile(
                       title: Text("item 1")),
                   ListTile(
                       title: Text("item 2")
                   )
                 ]
             )
         ) ,
       appBar:AppBar(title: const Text("Myapp"),
         actions:[IconButton(icon:Icon(Icons.info), onPressed: (){},),IconButton(icon:Icon(Icons.alarm), onPressed: () {  },)],
           ) ,
                       body: Column(children :<Widget>[DisplayArea(),
           logo()
         ]
         )
     )
   );
  }








}

class DisplayArea extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return Container(height:650);




  }



}






class logo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetimage=AssetImage("images/googleIcon.jpg");
    Image image=Image(image: assetimage);


    return Container(
      color:Colors.lime,
      child:Row(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [Text("Powered \n By ",
            style: TextStyle(fontFamily: "raleway",fontSize: 15),
          ),
            image]),
      alignment: Alignment.bottomLeft,
      height: 40,);
  }



}