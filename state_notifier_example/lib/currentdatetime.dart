import 'package:state_notifier/state_notifier.dart';

class CurrentDateTime extends StateNotifier<DateTime>{
 CurrentDateTime():super(DateTime.now());
 void refresh(){
   state=DateTime.now();
 }


}