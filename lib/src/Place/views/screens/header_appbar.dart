import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/Place/views/widgets/card_image_list.dart';
import 'package:flutter_trips_place_app/src/widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack( height: 250.0),
        CardImageList(width: 300,heigth: 300,left: 15.0,)
      ],
    );
  }

}