import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final connection = await Connectivity().checkConnectivity();

  runApp(MaterialApp(
    home: Scaffold(
      body: MyApp(
        connection: connection,
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  Stream<ConnectivityResult> connectivityResult =
      Connectivity().onConnectivityChanged;

  ConnectivityResult connection;

  MyApp({required this.connection});

  @override
  Widget build(BuildContext context) {
    connectivityResult.listen((event) {
      debugPrint(event.name);
    });
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(connection.name),
          StreamBuilder<ConnectivityResult>(
              stream: connectivityResult,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final conn = snapshot.data;
                  if (conn != null) {
                    return Text(conn.name);
                  }
                }
                return Text("No Status");
              })
        ],
      ),
    );
  }
}
