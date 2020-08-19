import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/restaurant.dart';
import '../../model/location.dart';

part 'zomato_event.dart';
part 'zomato_state.dart';

class ZomatoBloc extends Bloc<ZomatoEvent, ZomatoState> {
  final _apiKey = '7f8414787c6074e21ead49b56af7db49';
  final _host = 'developers.zomato.com';
  final _contextRoot = 'api/v2.1';

  Map<String, String> get _headers =>
      {'Accept': 'application/json', 'user-key': _apiKey};

  ZomatoBloc() : super(ZomatoInitial());

  @override
  Stream<ZomatoState> mapEventToState(
    ZomatoEvent event,
  ) async* {
    if (event is GetLocations) {
      yield ZomatoLoading();
      final location = await _fetchLocations(event.query);
      yield LocationLoaded(location);
    }
    if (event is GetRestaurants) {
      yield ZomatoLoading();
      final restaurant = await _fetchRestaurants(event.location, event.query);
      //   final restaurant = await _fetchFromFakeRestaurantsApi();
      yield RestaurantLoaded(restaurant);
    }
  }

  Future<Map> request(
      {@required String path, Map<String, String> parameters}) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return Future.delayed(Duration(seconds: 1), () {
      return jsonObject;
    });
  }

  Future<List<Restaurant>> _fetchFromFakeRestaurantsApi() async {
    List<Restaurant> output = [];
    output.add(Restaurant(id: 'id'));
    output.add(Restaurant(
      id: '1',
      name: 'Thalapakatti',
      currency: 'INR',
      thumbUrl: '',
      imageUrl: '',
      cuisines: 'asdfasdf',
      address: 'asdfasfasdf',
      rating: null,
      priceRange: 1,
    ));
    output.add(Restaurant(
      id: '2',
      name: 'Mohideen',
      currency: 'INR',
      thumbUrl: '',
      imageUrl: '',
      cuisines: 'asdfasdf',
      address: 'asdfasfasdf',
      rating: null,
      priceRange: 1,
    ));
    return output;
  }

  Future<List<Restaurant>> _fetchRestaurants(
      Location location, String query) async {
    final results = await request(path: 'search', parameters: {
      'entity_id': location.id.toString(),
      'entity_type': location.type,
      'q': query,
      'count': '10'
    });
    final restaurants = results['restaurants']
        .map<Restaurant>((json) => Restaurant.fromJson(json['restaurant']))
        .toList(growable: false);
    return restaurants;
  }

  Future<List<Location>> _fetchLocations(String query) async {
    final results = await request(
        path: 'locations', parameters: {'query': query, 'count': '10'});

    final suggestions = results['location_suggestions'];
    return suggestions
        .map<Location>((json) => Location.fromJson(json))
        .toList(growable: false);
  }
}
