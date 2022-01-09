import 'dart:async';
import 'package:display_google_map/provider.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'map page.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (_)=>gpsdata(), child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'google map',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Location location = new Location();

 late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData locationData;

  late Stream<LocationData> stream;
  late  final GoogleMapController mapcontroller;
void setController( GoogleMapController controller){mapcontroller=controller;}

  @override
  Widget build(BuildContext context) {

return
          Scaffold(body:Center(
            child:





 Column(
   children: [ElevatedButton(
       onPressed: () {

           displaySnack(context: context,msg:"6 location data is not  null" );

           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapPageS()));





       },
       child: Text("map")),

     ElevatedButton(
              onPressed: () {
        init(context);
        },
        child: Text("start")),
   ],
 ),
        ));







  }
void displaySnack({required BuildContext context,required String msg}){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text (msg),
  ));

}



  void init(BuildContext context) async {
    print("in build method");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("in build method"),
    ));

    _serviceEnabled = await location.serviceEnabled();

    print("1");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("1 _serviceEnabled  ${_serviceEnabled}"),
    ));

if(!_serviceEnabled){
    _serviceEnabled = await location.requestService();
    print("2");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("2 requestService ${_serviceEnabled}"),
    ));}

    _permissionGranted = await location.hasPermission();
displaySnack(context: context,msg:"3 _permissionGranted ${_permissionGranted.toString()}" );
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      displaySnack(context: context,msg:" 4 requestPermission ${_permissionGranted.toString()}" );
      if (_permissionGranted != PermissionStatus.granted) {
        displaySnack(context: context,msg:"5 PermissionStatus not granted" );
      }}
      final enablebackgroungmode= await location.enableBackgroundMode(enable: true);
      locationData = await location.getLocation();

      displaySnack(context: context,msg:"enablebackgroungmode ${enablebackgroungmode}" );

    context.read<gpsdata>().setLoc((locationData.latitude)??45.521563,(locationData.longitude)??-122.677433);
displaySnack(context: context, msg: "from provider ${ context.read<gpsdata>().lat}");

     // displaySnack(context: context,msg:"_locationData ${_locationData.latitude}" );


  }

}
