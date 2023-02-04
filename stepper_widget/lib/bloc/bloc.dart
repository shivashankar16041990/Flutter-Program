import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class StepIndexBloc extends Bloc<StepIndex, int> {
  StepIndexBloc(super.initialState) {
    on<increament>((event, emit) {
      emit(state + 1);
    });
    on<decreament>((event, emit) {
      emit(state - 1);
    });
  }
}
