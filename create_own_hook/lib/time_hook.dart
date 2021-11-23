import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
int useRandomGenerator(int value){
  return use<int> (_RandomGenerator(maxvalue: value));
}
class _RandomGenerator extends Hook<int>{
  final int maxvalue;
  const _RandomGenerator({required this.maxvalue});

  @override
  HookState<int, Hook<int>> createState() {
    return _RandomGeneratorState();
  }
  
  
}
class _RandomGeneratorState extends HookState<int,_RandomGenerator>{
  late final Random random;
  @override
  int build(BuildContext context) {
    return random.nextInt(100);
  }
  void initHook(){
    super.initHook();
    random=Random();
  }
  void dispose(){
   debugPrint("random variable is disposed") ;
   super.dispose();
  }
}