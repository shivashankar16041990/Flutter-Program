import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<Cold>((event, emit) {
      emit(Winter());
    });

    on<Hot>((event, emit) {
      emit(Summer());
    });
    on<Freezing>((event, emit) {
      emit(SnowFaling());
    });
  }
}
