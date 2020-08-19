
part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
const WeatherState();

@override
  List<Weather> get props => [];
}

class WeatherInitial extends WeatherState {

}

class WeatherLoading extends WeatherState {
}


class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded(this.weather);

  @override
  List<Weather> get props => [weather];
}

