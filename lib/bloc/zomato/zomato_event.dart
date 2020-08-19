part of 'zomato_bloc.dart';

abstract class ZomatoEvent {
  const ZomatoEvent();
}

class GetRestaurants<Restaurant> extends ZomatoEvent {
  final Location location;
  final String query;

  GetRestaurants(this.location,this.query);
}

class GetLocations<Location> extends ZomatoEvent {
  final String query;

  GetLocations(this.query);
}