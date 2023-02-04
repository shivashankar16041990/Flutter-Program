import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'video_widget.dart';
import 'volume_manager.dart';

void main() {
  return runApp(ChangeNotifierProvider<VolumeManager>(
      create: (_) => VolumeManager(),
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(title: Text("Play a Video")),
        body: VideoWidget(),
      ))));
}
