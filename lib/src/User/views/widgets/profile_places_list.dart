import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/Place/model/place_model.dart';

import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  final Place place = new Place(
    name: 'Knuckles Mountains Range',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage: 'https://picsum.photos/500/300/?image',
    likes: 7,
  );
  final Place place2 = new Place(
    name: 'Mountains',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage: 'https://picsum.photos/500/300/?image',
    likes: 9,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }
}
