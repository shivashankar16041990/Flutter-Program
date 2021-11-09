import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp3/app_screen/Counter_model.dart';
import "package:provider/provider.dart";

void main() {
  runApp(
      ChangeNotifierProvider<Counter_Model>( create: ((context) {
        return Counter_Model();
      }),child:const DemoPage()))
  ;
}

class DemoPage extends StatelessWidget {
  const DemoPage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.from(colorScheme: const ColorScheme.light()),
        home:  const DemoPageChild());
  }
}

class DemoPageChild extends StatelessWidget {
  const DemoPageChild();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:const DemoPageChildWidget() );
  }
}
class DemoPageChildWidget extends StatelessWidget{
  const DemoPageChildWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Row(children: [
          Expanded(
              child: Consumer<Counter_Model>(builder: ((context,countermodel,child)
              {
                return ElevatedButton(
                    onPressed: () {

                      countermodel.increament();
                    },
                    child: const Text(
                      "+",
                      textScaleFactor: 3,
                    ));}))),
          Expanded(
              child: Center(
                  child: const ShowCounter()




              )
          ),
          Expanded(
              child:Consumer<Counter_Model>(builder: ((context,countermodel,child)
    {
    return ElevatedButton(
                  onPressed: () {

                    countermodel.decrement();
                  },
                  child: const Text(
    "-",
    textScaleFactor: 3,
    ));}))
  ) ]));
  }




}
class ShowCounter extends StatelessWidget{
  const ShowCounter();
  @override
  Widget build(BuildContext context) {
    return   Consumer<Counter_Model>(builder: ((context,countermodel,child)
    {
      return Text(

          countermodel.counter
              .toString(),
          textScaleFactor: 3);
    }));





  }



}