import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/User/views/screens/profile_header.dart';
import 'package:flutter_trips_place_app/src/User/views/widgets/perfil_background.dart';
import 'package:flutter_trips_place_app/src/User/views/widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return Container(
      color: Colors.indigo,
    );*/
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    );
  }
}