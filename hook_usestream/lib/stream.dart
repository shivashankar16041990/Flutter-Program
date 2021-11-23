import 'dart:math';

class StreamDemoinHook {
  final r=Random();

  Stream<int> sendint()async*{
    while(true) {
      Future.delayed(Duration(seconds: 30));
      yield r.nextInt(100);
    }
  }
}