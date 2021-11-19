import 'package:flutter/material.dart';
import 'gyroscope.dart';
import 'useraccelerometer.dart';
import 'accelerometer.dart';


void main() {
  runApp(MaterialApp(home:Scaffold(appBar:AppBar(title: Text("Device Sensors")),body: MySensorApp())));
}
class MySensorApp extends StatelessWidget

{
  @override
  Widget build(BuildContext context) {
    return Wrap (spacing: 0.9,direction: Axis.vertical,children: [AccelerometerData(),UserAccelerometerData(),Gyroscope()],);

  }

}