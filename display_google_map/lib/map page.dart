import 'package:display_google_map/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class MapPageS extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MapPage();
  }

}


class MapPage extends State<MapPageS>{

  late  final GoogleMapController mapcontroller;

  void setController( GoogleMapController controller){mapcontroller=controller;}



  @override
  Widget build(BuildContext context) {



 return Scaffold(body:

   Center(
     child: GoogleMap(initialCameraPosition: CameraPosition(
 target: LatLng(Provider.of<gpsdata>(context).lat,Provider.of<gpsdata>(context).long

 )




     ,zoom: 11
       ),
         onMapCreated: setController,
         zoomControlsEnabled: true,
         zoomGesturesEnabled: true),
   ));
  }

  void displaySnack({required BuildContext context,required String msg}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text (msg),
    ));

  }



  }
