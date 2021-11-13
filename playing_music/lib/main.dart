import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(home: Scaffold(body: MyAudioPlayer())));
}

class MyAudioPlayer extends StatelessWidget {
  AudioPlayer _audioplayer = AudioPlayer();

  MyAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        "asset/music.svg",
        width: 100,
        height: 100,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: const Icon(Icons.open_in_browser), onPressed: _initialize),


          StreamBuilder<Duration>(
              stream: _audioplayer.positionStream,
              builder: (context, snapshot) {
                final time = snapshot.data;
                if (time != null) {
                  return Text(
                      "${time.inMinutes.remainder(60)} m  ${time.inSeconds
                          .remainder(60)}  s ");
                } else {
                  return Text("No time is Available");
                }
              })
        ],
      ),
    IconButton(icon: const Icon(Icons.pause_circle_filled),onPressed: (){
    _audioplayer.pause();}),
      IconButton(icon: const Icon(Icons.play_circle_fill),onPressed: (){
        _audioplayer.play();}),





    ]);
  }

  void _initialize() async {
    await _audioplayer.setAsset("asset/sleep.mp3");
    _audioplayer.play();
  }
}


