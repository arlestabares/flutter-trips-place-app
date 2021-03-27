import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/User/model/user_model.dart';

class Place {
  String id;
  final String name;
  final String description;
  final String urlImage;
  final int likes;
  final User userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    this.urlImage,
    this.likes,
    this.userOwner,
  });
}
