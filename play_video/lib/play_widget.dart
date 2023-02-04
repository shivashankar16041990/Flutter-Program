import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

import 'volume_manager.dart';

class PlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  PlayWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: VideoPlayer(controller),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(onPressed: _play, child: Text("play")),
                ElevatedButton(onPressed: _pause, child: Text("pause")),
              ]),
          Consumer<VolumeManager>(
            builder: (context, volumemanager, _) {
              return Slider(
                value: volumemanager.volume,
                min: 0,
                max: 100,
                onChanged: (value) {
                  volumemanager.set_volume(
                      volume_value: value, controller: controller);
                },
              );
            },
          )
        ]);
  }

  void _play() {
    debugPrint("play button is press");

    if (!controller.value.isPlaying) {
      controller.play();
      debugPrint("video is playing");
    }
  }

  void _pause() {
    debugPrint("pause button is press");
    if (controller.value.isPlaying) {
      controller.pause();
      debugPrint("video is pause");
    }
  }
}
