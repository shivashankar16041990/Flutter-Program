import 'package:flutter/material.dart';
import "package:geolocator/geolocator.dart";

void main() {
  runApp( MaterialApp(home:Scaffold(appBar:AppBar(title: Text("GPS"),),body:MyApp())));
}

class MyApp extends StatelessWidget {
 static final _stream=Geolocator.getPositionStream();
  @override
  Widget build(BuildContext context) {return
  Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children:[StreamBuilder<Position>(
    stream: _stream,
    builder: (context,snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data;
        if (data != null) {
          final lat = data.latitude.toStringAsFixed(4);
          final long = data.longitude.toStringAsFixed(4);
          final alt = data.altitude.toStringAsFixed(4);
          final speed = data.speed.toStringAsFixed(4);


          return Text("latitude : $lat \n"
              "longitude : $long \n"
              "altitude : $alt \n"
              "speed : $speed \nm/s ");
        }
        return Text("Turn on gps no data to show");
      }
       return CircularProgressIndicator();
    }


  )
  ]
  )
  );
  }

}
