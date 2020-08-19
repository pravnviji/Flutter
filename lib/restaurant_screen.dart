import 'package:NewFlutterApp/bloc/bloc.dart';
import 'model/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'model/restaurant.dart';
import 'weatherpage.dart';

class RestaurantScreen extends StatelessWidget {
  final Location location;

  const RestaurantScreen({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: _buildSearch(context),
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
        ),
        BlocProvider<ZomatoBloc>(
          create: (context) => ZomatoBloc()
            ..add(GetRestaurants(this.location, this.location.title)),
          child: _buildRestuarantBuilder(context),
        )
      ],
    );
  }

  // 1
  Widget _buildRestuarantBuilder(BuildContext context) {
    return Expanded(
      child: Container(
        child: BlocBuilder<ZomatoBloc, ZomatoState>(
            // ignore: missing_return
            builder: (_, state) {
          if (state is ZomatoInitial) {
            return buildRestaurantInitial();
          } else if (state is ZomatoLoading) {
            return WeatherPage.buildLoading();
          } else if (state is RestaurantLoaded) {
            return buildStreamBuilder(state.restaurant);
          }
        }),
      ),
    );
  }

  Widget buildRestaurantInitial() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'What do you want to eat?'),
        // onChanged: (query) => bloc.submitQuery(query),
      ),
    );
  }

  Widget buildStreamBuilder(List<Restaurant> results) {
    if (results == null) {
      return Center(child: Text('Enter a restaurant name or cuisine type'));
    }

    if (results.isEmpty) {
      return Center(child: Text('No Results'));
    }

    return buildSearchResults(results);
  }

  Widget buildSearchResults(List<Restaurant> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final restaurant = results[index];
        return (restaurant != null)
            ? ListTile(title: Text('' + restaurant.name))
            : Text('No result found');
      },
    );
  }
}
