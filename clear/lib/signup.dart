import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      RichText(
          textAlign: TextAlign.center,
          textScaleFactor: 2,
          text: TextSpan(
              text: 'SignUp to news Letter, and  ',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'unlock a theme for your lists',
                )
              ])),
      Image.asset('asset/mail.png'),
      Padding(
        padding: EdgeInsets.all(20),
        child: TextFormField(
            decoration: InputDecoration(
                hintText: "E Mail Address",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)))),
      ),
      Container(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 200,
            height: 80,
            child: Padding(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                  child: Text(
                    "Skip",
                    textScaleFactor: 2,
                  ),
                  onPressed: () {},
                )),
          ),
          Container(
              width: 200,
              height: 80,
              child: Padding(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    child: Text(
                      "Join",
                      textScaleFactor: 2,
                    ),
                    onPressed: () {},
                  )))
        ],
      )
    ]);
  }
}
