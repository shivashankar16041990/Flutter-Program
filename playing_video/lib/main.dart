import 'package:flutter/material.dart';
import 'package:playing_video/videowidget.dart';
import 'package:playing_video/volumemanager.dart';
import 'package:provider/provider.dart';



void main() {
  return
  runApp(
      ChangeNotifierProvider<VolumeManager>(
        create:(_)=>VolumeManager(),
        child:MaterialApp(home:Scaffold(appBar: AppBar(title:Text("Play a Video")),body: VideoWidget(),))


      ));
}

