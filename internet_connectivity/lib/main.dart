import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:connectivity_platform_interface/connectivity_platform_interface.dart';
void main() {
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Battery level"),
          ),
          body: MyInternetConnectivityApp())));
}

class MyInternetConnectivityApp extends StatelessWidget {
  static final connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      FutureBuilder<ConnectivityResult>(
          future: connectivity.checkConnectivity(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              if (data != null) {
                final connectiontype = snapshot.data;
                switch (connectiontype) {
                  case ConnectivityResult.mobile:
                    {

                      debugPrint("connected to mobile data");
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("connected to mobile data")));
                      return Icon(IconData(57375, fontFamily: 'MaterialIcons'));
                    }
                  case ConnectivityResult.wifi:
                    {
                      debugPrint("connected to wifi");
                      // ScaffoldMessenger.of(context).showSnackBar(
                      // SnackBar(content: Text("connected to mobile data")));
                      return Icon(IconData(61964, fontFamily: 'MaterialIcons'));
                    }

                  case ConnectivityResult.none:
                    {
                      debugPrint("internet connection is not available");
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("connected to mobile data")));

                      return Icon(
                        IconData(58793, fontFamily: 'MaterialIcons'),
                      );
                    }
                }
              }
            }
            return CircularProgressIndicator();
          })
    ]));
  }
}
