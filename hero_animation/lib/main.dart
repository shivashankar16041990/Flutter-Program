import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image im = Image.asset('assets/money.png');
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NextRoute())),
            child: Hero(tag: "secondpage", child: im)),
        title: Text("Hero Animation"),
     ),body: GestureDetector( onTap: () => Navigator.of(context)
        .push(PageRouteBuilder(pageBuilder: (context, _, __) => NextRoute3(),
      transitionsBuilder: (context, animation, _, child) =>
          SlideTransition(
              position: Tween<Offset>(begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
            child: child,
          ),)),),
    );
  }
}

class NextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Hero(
        tag: "secondpage",
        child: Text(
          "second Page",
          textScaleFactor: 3,
        )),
        appBar: AppBar(title: Text("second Page"),)

    );
  }
}

class NextRoute3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Text(
          "Third Page",
          textScaleFactor: 3,
        )
    ,appBar: AppBar(title: Text("Third Page"),),
    );
  }
}
