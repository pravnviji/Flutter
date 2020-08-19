import 'package:NewFlutterApp/bloc/bloc.dart';
import 'model/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'restaurant_screen.dart';
import 'weatherpage.dart';

class BlocLocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;

  const BlocLocationScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose the location?')),
      body: locationPage(context),
    );
  }

  Widget locationPage(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
      ),
      BlocProvider(
        create: (context) => ZomatoBloc(),
        child: _buildResults(context),
      ),
    ]);
  }

  // 1
  Widget _buildResults(BuildContext context) {
    return Expanded(
      child: Container(child: BlocBuilder<ZomatoBloc, ZomatoState>(
          // ignore: missing_return
          builder: (BuildContext context, ZomatoState state) {
        if (state is ZomatoInitial) {
          return buildZomatoLocationInitial(context, state.location);
        } else if (state is ZomatoLoading) {
          return WeatherPage.buildLoading();
        } else if (state is LocationLoaded) {
          return _buildSearchResults(state.location);
        }
      })),
    );
  }

  Widget buildZomatoLocationInitial(BuildContext context, dynamic location) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter a location'),
        onSubmitted: (query) =>
            BlocProvider.of<ZomatoBloc>(context).add(GetLocations(query)),
      ),
    );
  }
}

Widget _buildSearchResults(List<Location> results) {
  return ListView.separated(
    itemCount: results.length,
    separatorBuilder: (BuildContext context, int index) => Divider(),
    itemBuilder: (context, index) {
      var location = results[index];
      return (location != null)
          ? ListTile(
              title: Text(location.title),
              onTap: () {
            //    BlocProvider.of<RestaurantDartBloc>(context)
              //      .add(GetRestaurants(location, location.title));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RestaurantScreen(location: location)));
              })
          : Text('No result found');
    },
  );
}
