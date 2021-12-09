import 'dart:async';

import 'package:flutter/material.dart';


class CountineousStream with ChangeNotifier{
  int value=0;
  bool startstream=false;
  StreamController<int> controller = StreamController.broadcast();
  late StreamSubscription<int> sub;
  CountineousStream(){
 // controller.addStream(intstream2());
//  sub=controller.stream.listen((event) {value=event;notifyListeners(); });

  }
  Stream<int> intstream()async*{

    for(int i=0 ;i<20;i++){
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }


  }
  void resume(){
   // sub.resume();
    startstream=true;
    assign( value);
  }

void pause(){
   // sub.pause();
    startstream=false;

}
void start(){
    if(startstream==false){
  startstream=true;
 // sub=controller.stream.listen((event) {value=event;notifyListeners(); });
   assign( 0);}
}

void assign(int startwith)async{
    await for(int i in intstream2(startwith)){
      value=i;
      notifyListeners();
    }
}


  Stream<int> intstream2(int startwith)async* {

    for(int i=startwith;i<1000;i++) {
      yield i;
      await Future.delayed(Duration(seconds: 1));
      if(startstream==false){
        break;
      }
    }
  }


}
