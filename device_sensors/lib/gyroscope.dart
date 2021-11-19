import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'ChipWithIcon.dart';

class Gyroscope extends StatelessWidget
{
  static final   initialData=GyroscopeEvent(0, 0, 0);
  const Gyroscope();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GyroscopeEvent>(stream: gyroscopeEvents,
      initialData: initialData,
      builder: (context,snapshot){
        final data=snapshot.data;
        if(data!=null){
          final x=data.x.toStringAsFixed(2);
          final y=data.y.toStringAsFixed(2);
          final z=data.z.toStringAsFixed(2);
          return ChipWithIcon(icon:Icon(Icons.airline_seat_legroom_normal_rounded),text:"Gyroscope: $x, $y, $z");
        }
        return ChipWithIcon(icon:Icon(Icons.airline_seat_legroom_normal_rounded),text:"No data to display");

      },




    );
  }


}