import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gamescore.dart';

class NumberContainer extends StatelessWidget {
  const NumberContainer();
  @override
  Widget build(BuildContext context) {
    return Consumer<GameScore>(builder: (context, gamescore, _) {
      return Draggable<int>(data: gamescore.currentValue,
          child:  Container(decoration:const  BoxDecoration(color:Colors.orange,
            shape: BoxShape.circle,
            //  borderRadius: BorderRadius.circular(60)
          ),
              width: 60, height: 60, child: Center(child: Text("${gamescore.currentValue}"))),
          feedback:  Container(width: 80,
            height: 80,
            child:   Center(child: Text("${gamescore.currentValue}",

              style: const TextStyle(

                decoration: TextDecoration.none,
                decorationStyle: TextDecorationStyle.dotted,
              ),





            )),
            decoration: BoxDecoration(
              color:Colors.orange,
                shape: BoxShape.circle,
              //  borderRadius: BorderRadius.circular(60)
            ),


          ));
    });
  }

}