import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gamescore.dart';
import 'snackmessage.dart';

class OddContainer extends StatelessWidget with showSnackBar{
  const OddContainer();
  @override
  Widget build(BuildContext context) {
   return
      Container(
       width: 100,height: 100,decoration:  BoxDecoration(color:Colors.blueAccent,borderRadius:  BorderRadius.circular(10)),
       child: DragTarget<int>(builder: (context,_,__){
         return const Center(child: const Text("Odd"));
       },
       onAccept: (value)=>_onAccept(context,value),
         onWillAccept: _willAccept,


       ),

     );
  }
bool _willAccept(int? value){
   // return (value!=null && value%2==1);
  return true;
}
void  _onAccept(BuildContext context, int value){
    //context.read<GameScore>().addPoints(1);
  if(value!=null && value%2==1){
    context.read<GameScore>().addPoints(1);
    showMessage(context,"Good , Point Increased");
  }
  else
    {
      context.read<GameScore>().addPoints(-1);
    }

}

}