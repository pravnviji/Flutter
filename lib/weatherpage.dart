import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/bloc.dart';
import 'model/weather/weather.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key key}) : super(key: key);

  _WeatherPageState createState() => _WeatherPageState();

  static Widget buildLoading() {
    return Center(
      child: Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: CircularProgressIndicator()),
    );
  }
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Weather App"),
      ),
      body: Container(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          // ignore: missing_return
            builder: (BuildContext context, WeatherState state) {
          // Changing the UI based on the current state
          if (state is WeatherInitial) {
            return buildInitialInput();
          } else if (state is WeatherLoading) {
            return WeatherPage.buildLoading();
          } else if (state is WeatherLoaded) {
            return buildColumnWithData(state.weather);
          }
        }),
      ),
    );
  }
}

Widget buildInitialInput() {
  return Center(
    child: CityInputField(),
  );
}



// Builds widgets from the starter UI with custom weather data
Column buildColumnWithData(Weather weather) {
  return Column(
   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          // Display the temperature with 1 decimal place
          "${weather.temperature.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
      ),
      CityInputField(),
    ],
  );
}

class CityInputField extends StatefulWidget {
  const CityInputField({
    Key key,
  }) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal:50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Check Weather Status in Your place ',
            style: TextStyle(color: Colors.deepOrange, fontSize: 22.0),
          ),
          TextField(
            onSubmitted: submitCityName,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: "Enter a city",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }

  void submitCityName(String cityName) {
    BlocProvider.of<WeatherBloc>(context).add(GetWeather(cityName));
  }
}
