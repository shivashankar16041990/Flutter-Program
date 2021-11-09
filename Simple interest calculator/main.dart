import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.indigo,



  ),
      title: "Simple Interest Calculator",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Simple Interest Calculator"),
          ),
          body: Container(margin: EdgeInsets.all(50), child: SIForm()))));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SIFormstate();
  }
}

class SIFormstate extends State<SIForm> {
  final pad = 10;
  String Selected = "rupees";
  String claculated_intrest="";
  var principle , interest , period ;
TextEditingController tec_principle=TextEditingController();
  TextEditingController tec_interest=TextEditingController();
  TextEditingController tec_period=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textStyle=Theme.of(context).textTheme.subtitle2;




    return ListView(children: <Widget>[
      addimage(),
      Padding(
          padding: EdgeInsets.all(5),
          child: TextField(onChanged: (String element){this.principle=double.parse(element);},

              controller: tec_principle,
              style: textStyle,

              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: textStyle,
                  labelText: "Principal",
                  hintText: "Enter amount e.g.1200",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))))),
      Padding(
          padding: EdgeInsets.all(5),
          child: TextField(style: textStyle,controller: tec_interest,
              onChanged: (String element){this.interest=double.parse(element);},
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelStyle: textStyle,
                  labelText: "Rate of Interest",
                  hintText: "in %",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))))),
      Padding(
          padding: EdgeInsets.all(2),
          child: Row(children: <Widget>[
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(2),
                    child: TextField(onChanged: (String element){period=double.parse(element);},
                        controller: tec_period,
                        style: textStyle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Period",
                            labelStyle: textStyle,
                            hintText: "in years",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)))))),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Center(
                        child: DropdownButton(style: textStyle,
                          items: getmenuitems(context),
                          value: Selected,
                          onChanged: ((value) {
                            setState(() {
                              Selected=value.toString();
                            });

                          }),
                        )))),
          ])),
      Row(
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                      onPressed: () {

                        setState(() {
                          claculated_intrest="your calculated Interest is ${(principle*period*interest)/100}";



                      //    debugPrint("inside setState method");

                      });



                      }, child: Text("Calculate",textScaleFactor: 1.2,),))),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(2),
                  child:
                  ElevatedButton(onPressed: () {
                    tec_period.text="";
                    tec_interest.text="";
                    tec_principle.text="";
                    claculated_intrest="";
                 setState(() {
                   Selected = "rupees";

                 });


                  }, child: Text("Reset",textScaleFactor: 1.2)))),
        ],
      ),
      Container(
          width: 200,
          height: 200,
          child: Expanded(
              child: Center(child: Text(this.claculated_intrest,style:textStyle))))
    ]);
  }

  Widget addimage() {
    AssetImage assetimg = AssetImage("images/interest.png");
    Image img = Image(
      image: assetimg,
      width: 130,
      height: 130,
    );
    return Center(child: img);
  }








}

List<DropdownMenuItem<String>> getmenuitems(BuildContext context)
{
  List<String> currencies = List.empty(growable: true);
  currencies.add("dollar");
  currencies.add("rupees");
  List<DropdownMenuItem<String>> menuitemlist = List.empty(growable: true);
  currencies.forEach((element) {
    menuitemlist.add(DropdownMenuItem(child: Text(element,style:Theme.of(context).textTheme.subtitle1), value: element));
  });

  return menuitemlist;



}


