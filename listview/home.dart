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
              ]),FlightImageAsset(),FlightBookButton()
            ])));
  }
}


class FlightImageAsset extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    AssetImage assetimage=AssetImage("images/flight.png");
    Image image=Image(image: assetimage);
    return Container(child: Center(child: image),width: 400,height:300);


  }}
class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 50,
        margin: EdgeInsets.only(top: 30),
        child: ElevatedButton(
          onPressed: () {
            bookFlight(context);
          },
          child: Text(
            "Book Fight",
            style: TextStyle(fontFamily: "Raleway"),
          ),
        )
    );
  }

  void bookFlight(BuildContext context) {
    var alertdialog = AlertDialog(
        title: Text("Congratualation"),
        content: Text("you have successfully booked a ticket"));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertdialog;
        });
  }
}