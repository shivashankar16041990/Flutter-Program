import 'package:flutter/material.dart';


class SvgDecoder extends StatelessWidget {
const SvgDecoder();

@override
Widget build(BuildContext context) {
  return Column(mainAxisSize: MainAxisSize.min,
    children: [
      CircularProgressIndicator(),
      Padding(padding: EdgeInsets.only(top: 10),child: Text ("Svg Decoding..."),)
    ],);
}

}