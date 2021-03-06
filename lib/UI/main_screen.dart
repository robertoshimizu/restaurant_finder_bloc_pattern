import 'package:flutter/material.dart';
import 'package:restaurant_finder/Bloc/blocs.dart';

import 'package:restaurant_finder/DataLayer/entities.dart';

import 'screens.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Location>(
        stream: BlocProvider.of<LocationBloc>(context).locationStream,
        builder: (context, snapshot) {
          final location = snapshot.data;

          // 2
          if (location == null) {
            return LocationScreen();
          }

          // This will be changed this later
          return RestaurantScreen(location: location);
        });
  }
}
