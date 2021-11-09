import 'package:flutter/material.dart';
class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            // width: 200,
            // height:200,
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "mumbai",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      color: Colors.orange,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w700),
                )),
                Expanded(
                    child: Text(
                  "Sion panvel Expressway",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 22.0,
                      color: Colors.orange,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w700),
                ))
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: Text(
                  "pune",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 35.0,
                      fontFamily: "Raleway",
                      color: Colors.orange,
                      fontWeight: FontWeight.w700),
                )),
                Expanded(
                    child: Text(
                  "karjat highway",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 22.0,
                      color: Colors.orange,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w700),
                ))
              ])
            ])));
  }
}