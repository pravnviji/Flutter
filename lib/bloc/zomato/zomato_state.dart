part of 'zomato_bloc.dart';

@immutable
abstract class ZomatoState extends Equatable {
  const ZomatoState();

  @override
  List<Object> get props => [];
}

class ZomatoInitial extends ZomatoState {
  final List<Location> location;
  final List<Restaurant> restaurant;
  const ZomatoInitial({this.location, this.restaurant});
}

class ZomatoLoading extends ZomatoState {}

class LocationLoaded extends ZomatoState {
  final List<Location> location;

  const LocationLoaded(this.location);

  @override
  List<List<Location>> get props => [location];
}

class RestaurantLoaded extends ZomatoState {
  final List<Restaurant> restaurant;

  const RestaurantLoaded(this.restaurant);

  @override
  List<List<Restaurant>> get props => [restaurant];
}
