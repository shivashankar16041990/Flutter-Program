part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Cold extends WeatherEvent {}

class Hot extends WeatherEvent {}

class Freezing extends WeatherEvent {}
