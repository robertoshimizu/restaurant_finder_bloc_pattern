import 'package:flutter/material.dart';
import 'package:restaurant_finder/Bloc/bloc_provider.dart';
import 'package:restaurant_finder/Bloc/location_bloc.dart';

import 'UI/screens.dart';

void main() => runApp(RestaurantFinder());

class RestaurantFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: MaterialApp(
        title: 'Restaurant Finder',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MainScreen(),
      ),
    );
  }
}
