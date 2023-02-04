import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'Play_Widget.dart';

class VideoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoWidgetState();
  }
}

class VideoWidgetState extends State<VideoWidget> {
  late final VideoPlayerController controller;
  late final Future<void> initVideo;

  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("video_asset/aashi.mp4");
    controller.setLooping(true);
    initVideo = controller.initialize();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: initVideo,
        builder: (context, asyncsnapshot) {
          if (asyncsnapshot.connectionState == ConnectionState.done) {
            debugPrint("from video player connection");
            return PlayWidget(controller: controller);
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
