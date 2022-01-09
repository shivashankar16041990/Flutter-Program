import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
class gpsdata with ChangeNotifier{
  late double lat;
  late double long;
  void setLoc(double latitude,double longitiude){
    lat=latitude;
    long=longitiude;
    notifyListeners();
  }


}