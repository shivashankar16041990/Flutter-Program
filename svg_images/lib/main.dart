import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(
        children: [
          SvgPicture.asset(
            "asset_svg/cat.svg",
            height: 200,
            width: 300,
            placeholderBuilder: (_) {
              return const CircularProgressIndicator();
            },
            alignment: Alignment.center,
          ),SvgPicture.asset(
            "asset_svg/me.svg",
            height: 200,
            width: 300,
            placeholderBuilder: (_) {
              return const CircularProgressIndicator();
            },
            alignment: Alignment.center,
          ),SvgPicture.asset(
            "asset_svg/cake.svg",
            height: 400,
            width: 500,
            placeholderBuilder: (_) {
              return const CircularProgressIndicator();
            },
            alignment: Alignment.center,
          ),
          SvgPicture.network(
            "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/410.svg",
            height: 300,
            width: 400,
            placeholderBuilder: (_) {
              return const CircularProgressIndicator();
            },
            alignment: Alignment.center,
          )
        ],
      ),
    ));
  }
}
