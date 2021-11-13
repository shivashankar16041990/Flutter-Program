import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VolumeManager with ChangeNotifier{
  var _volume=50.0;
  double get volume =>_volume;

  void set_volume({required double volume_value,required VideoPlayerController controller })
  {
    _volume=volume_value;
    controller.setVolume(_volume);
    notifyListeners();

  }


}