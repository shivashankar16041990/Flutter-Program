import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(myapp()



  );












}
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return CupertinoApp(title: "My App",
    home:myapp2());















  }




}
class myapp2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return
      CupertinoTabScaffold(
        tabBar: CupertinoTabBar(



            items: [BottomNavigationBarItem(
                icon:Icon(
                    CupertinoIcons.home),
                label: "Home"),
              BottomNavigationBarItem(
                  icon:Icon(
                      CupertinoIcons.mail),
                  label: "Mail")]
        ),
        tabBuilder: (context,index){


          return Center(
              child : Column(
                  children: <Widget>[
                    Padding(
                        padding:EdgeInsets.all(50),
                        child:Text("This is the screen $index")),
                    CupertinoButton(
                        color: Colors.blueAccent,
                        onPressed:()=>
                          showDialogbox( context)




                        ,child:const Text("Cupertino Button")
                    )
                  ]
              )
          );





        },













      );







  }




 showDialogbox(BuildContext context)
{
return
  showCupertinoDialog<void>(context:context,builder:(BuildContext context)
  =>
      CupertinoAlertDialog(
          title: const Text(
              "Cupertino Alert Dialog"),
          content: const Text(
              "IOS LOOK"),
          actions: <CupertinoDialogAction>[CupertinoDialogAction(child: const  Text("OK"),
              onPressed:
                  ()=>
                  Navigator.pop(context,"OK i am "))]));





}


}