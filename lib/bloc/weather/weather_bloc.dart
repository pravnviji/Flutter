import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Weather weather;
  StreamSubscription subscription;
  WeatherBloc(this.weather) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetWeather) {
      yield WeatherLoading();
      final weather = await _fetchWeatherFromFakeApi(event.cityName);
      yield WeatherLoaded(weather);
    }
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(
      Duration(seconds: 10),
      () {
        return Weather(
            cityName: cityName,
            temperature: 20 + Random().nextInt(15) + Random().nextDouble());
      },
    );
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
