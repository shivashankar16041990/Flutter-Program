import 'package:flutter/material.dart';

class Icloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("asset/cloud.jpg"),
        RichText(
          textAlign: TextAlign.center,
          textScaleFactor: 2,
          text: TextSpan(
            text: 'Use ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: 'iCloud?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          textScaleFactor: 2,
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'storing your list in icloud allows  ',
              ),
              TextSpan(
                text: '\n you to keep your data in sync  ',
              ),
              TextSpan(
                text: '\n across iPhone,imac,ipad ',
              ),
            ],
          ),
        ),
        Container(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("Not Now"),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("Use iCloud"),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
