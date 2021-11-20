import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider<ValueProvider>(
      create: (_) => ValueProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body:Row(children: [Consumer<ValueProvider>(builder:(context,vp,_){return NavigationRail(
            onDestinationSelected:  (int value){vp.update_selected_index(value);},
            selectedIndex: vp.selected_index,
            destinations: [
              const  NavigationRailDestination(icon:const  Icon(Icons.home), label:const Text(  "Home")),
              const  NavigationRailDestination(icon: const  Icon(Icons.settings), label: const Text( "Settings")),
              const  NavigationRailDestination(icon: const  Icon(Icons.share), label: const Text( "Share")),
            ]);})
        ,
          const VerticalDivider(thickness: 1,width:1,),
          Expanded(child: Center(child: Consumer<ValueProvider>(builder:(context,vp,_){return Text("page selected ${vp.selected_index}");},)),)


        ],)));

  }


}


class ValueProvider with ChangeNotifier{

   var  selected_index=0;
  void update_selected_index(int value){
    selected_index=value;
    notifyListeners();
  }


}