import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svgpicture_with_dio/downloader.dart';
import 'package:svgpicture_with_dio/svg_decoder.dart';
import 'package:svgpicture_with_dio/errorWidget.dart' as e;
import 'network_loader.dart';

//import 'package:svgpicture_with_dio/errorWidget.dart';
void main() {
  return runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Downloading a svg file with dio"),
          ),
          body: SvgFromWeb())));
}

class SvgFromWeb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SvgFromWebState();
  }
}

class SvgFromWebState extends State<SvgFromWeb> {
  late final Downloader downloader;
  late final Future<List<int>> svgImage;

  void initState() {
    super.initState();
    downloader = const Downloader(url: "/demoimages/firefox.svg");
    svgImage = downloader.start();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: svgImage,
      builder: (context, snapshot) {
        if (snapshot.hasError) return e.ErrorWidget();
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            SvgPicture.memory(Uint8List.fromList(snapshot.data!),
                placeholderBuilder: (_) => const SvgDecoder());
          } else {
            return e.ErrorWidget();
          }
        }

        return const NetworkLoader();
      },
    );
  }
}
