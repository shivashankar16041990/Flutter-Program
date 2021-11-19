import 'package:flutter/material.dart';
import "package:battery/battery.dart";
import '';
void main() {
  runApp( MaterialApp(home:Scaffold(appBar:AppBar(title: Text("Battery level"),),body:MyBatteryApp())));
}

class MyBatteryApp extends StatelessWidget {
var battery=Battery();


  @override
  Widget build(BuildContext context) {
    return
      Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[FutureBuilder<int>(
          future: battery.batteryLevel,
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              if (data != null) {



                return Text("BATTERY level :$data"
                    );
              }
              return Text("No data is available for battery level");
            }
            return CircularProgressIndicator();
          }


      ),

          StreamBuilder<BatteryState>(
          stream:battery.onBatteryStateChanged ,
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              if (data != null) {


                return Text("new update :${snapshot.data.toString()}");
              }
              return Text("Turn on gps no data to show");
            }
            //return CircularProgressIndicator();
            return Text('Battery State Unknown');
          }





          )







          ]
      )
      );
  }

}
