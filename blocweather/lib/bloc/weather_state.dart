part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  WeatherState(this.info);
  String info;
  @override
  List<Object> get props => [info];
}

class WeatherInitial extends WeatherState {
  WeatherInitial() : super("press the button");
}

class Summer extends WeatherState {
  Summer() : super("Temp neaby 40 degree ");
}

class Winter extends WeatherState {
  Winter() : super("Temp neaby 20 degree ");
}

class SnowFaling extends WeatherState {
  SnowFaling() : super("Temp below 0 degree ");
}
