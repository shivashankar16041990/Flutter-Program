import 'package:flutter/material.dart';

class NetworkLoader extends StatelessWidget {
  const NetworkLoader();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        Padding(padding: EdgeInsets.only(top: 10),child: Text ("Loading..."),)
      ],);
  }

}