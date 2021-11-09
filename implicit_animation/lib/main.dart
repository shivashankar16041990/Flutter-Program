import 'package:flutter/material.dart';
Alignment alignment = Alignment.bottomRight;
bool i = true;

Stream<bool> getint() async* {
  await Future.delayed(Duration(seconds: 10));
  if (i == true)
    i = false;
  else
    i = true;
  yield i;
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: container())));
}

class container extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return containerState();
  }
}

class containerState extends State<container> {
  Color color = Color(0x73000000);
  var pad = EdgeInsets.all(20.0);



  Future<void> reset() async {
    await for (var value in getint()) {
      setState(() {});
      debugPrint("value $value");
      debugPrint("color.value ${color.value}");
      if (value == true) {
        pad = EdgeInsets.all(1.0);
        color = Colors.red;
        alignment = Alignment.topRight;
      } else {
        color = Colors.lightBlueAccent;
        pad = EdgeInsets.all(80.0);
        alignment = Alignment.bottomLeft;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    reset();
    debugPrint("${alignment.toString()}");
    return Center(
        child: AnimatedContainer(alignment: alignment,width: 400,height: 400,
            duration: Duration(seconds: 3),
            padding: pad,
            color: color,
            curve: Curves.easeInOut,
            child: Text(
              "animated container ",
              textScaleFactor: 4,
            )));
  }
}

class align extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return alignState();
  }
}

class alignState extends State<align> {
  Alignment alignment = Alignment.center;

  Future<void> reset() async {
    await for (var value in getint()) {
      if (value == true) {
        alignment = Alignment.topLeft;
      } else {
        alignment = Alignment.bottomRight;
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    reset();
    return Center(
      child: Row(
        children: [
          Container(

              padding: const EdgeInsets.all(8.0),
              child: AnimatedAlign(
                          heightFactor: 200,
                          widthFactor: 200,
                          child: Text("hi this is animated container "),
                          duration: Duration(seconds: 4),
                          curve: Curves.bounceInOut,
                          alignment: alignment),

          ),
        ],
      ),
    );
  }
}

class opacity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return opacityState();
  }
}

class opacityState extends State<opacity> {
  double i = 0;

  Future<void> reset() async {
    await for (var value in getint()) {
      if (value == true) {
        i=0;
      } else {
       i=1;
      }

      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    reset();
    return Center(
        child: Column(children: [
      ElevatedButton(
          child: Text(
            "press me",
            textScaleFactor: 3,
          ),
          onPressed: () {
            if (i > 1.0)
              i = 0;
            else
              i = 1;
            setState(() {});
          }),
      AnimatedOpacity(
        duration: Duration(seconds: 3),
        opacity: i,
        curve: Curves.easeInOut,
        child: Text(
          "hi this is animated container $i",
          textScaleFactor: 4,
        ),
      )
    ]));
  }
}

class physical_model extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
        child: Text(
          "hi this is animated container ",
          textScaleFactor: 4,
        ),
        shape: BoxShape.rectangle,
        elevation: 5.0,
        color: Colors.lightBlueAccent,
        shadowColor: Colors.black,
        duration: Duration(seconds: 6));
  }
}
