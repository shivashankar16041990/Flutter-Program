import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
void main()
{
  runApp(ChangeNotifierProvider<CountineousStream>(create: (_)=>CountineousStream(),child: MyApp(),));
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(home: Scaffold(body: CustomStream(),),);
  }

}

class MyStream extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return Consumer<CountineousStream>(builder: (context,obj,_){
     return Center(child:StreamBuilder<int>(stream:obj.intstream(),builder: (context,snapshot){
       if(snapshot.hasData){

         return Text("${snapshot.data}");
       }
       if(snapshot.hasError)
         {
           return Text("error");
         }
       return CircularProgressIndicator();
     },));
   },);
   //Center(child:Text())
  }

}

class CustomStream extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[Text("${context.watch<CountineousStream>().value}"),
    ElevatedButton(child: Text("start"),onPressed: (){context.read<CountineousStream>().start();},),
      ElevatedButton(child: Text("pause"),onPressed: (){context.read<CountineousStream>().pause();},),
      ElevatedButton(child: Text("resume"),onPressed: (){context.read<CountineousStream>().resume();},),


    ]));


  }

}
