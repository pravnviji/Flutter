part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent();
}

class GetWeather<Weather> extends WeatherEvent {
  final String cityName;

  GetWeather(this.cityName);
}
