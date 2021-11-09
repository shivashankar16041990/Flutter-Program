import 'dart:io';

import 'package:flutter/material.dart' ;

void main() {
  runApp(myapp());
}


class myapp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return

      MaterialApp(

          title:"My App",theme: ThemeData.light(),
          home:Scaffold(
              body: Center(
                  child:Row(
                      children:<Widget>[
                        MyList(),Padding(padding:EdgeInsets.all(20),child:
                        Expanded(child:Text("you are working on ${Platform.operatingSystem}"))
                        )
                      ]
                  )
              )


)      );

  }


}


class MyList extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
if(Platform.isAndroid)
  {
  return
    Padding(padding:EdgeInsets.all(20),child: Expanded(child:Text ("you are working on android")));
   }
else if(Platform.isIOS)
{
  return
    Padding(padding:EdgeInsets.all(20),child:  Expanded(child: Text ("you are working on IOS")));
}
  else
    {
      return
        Padding(padding:EdgeInsets.all(20),child: Expanded(child:Text("you are working on ${Platform.operatingSystem}")));
    }
}

}

