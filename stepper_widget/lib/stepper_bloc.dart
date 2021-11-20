import 'package:flutter_bloc/flutter_bloc.dart';
abstract class step_bloc{}
class increment implements step_bloc{

}
class decrement implements step_bloc{

}


class stepper_bloc extends Bloc<step_bloc,int>
{
  stepper_bloc() : super(0){
    on<increment>((event, emit) => emit(state + 1));
  on<decrement>((event, emit) => emit(state - 1));}

}