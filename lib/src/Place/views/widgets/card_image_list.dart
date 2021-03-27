import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/Place/views/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  final double width;
  final double left;
  final double heigth;

  CardImageList({
    Key key,
    @required this.width,
    @required this.left,
    @required this.heigth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
   // padding: EdgeInsets.all(20.0),
      height: 350.0,
      child: ListView(
      
        padding: EdgeInsets.all(1.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            pathImage: "assets/img/beach_palm.jpeg",
            icondata: Icons.favorite_border,
            width: width,
            height: heigth,
            left: left,
          ),
          
          CardImageWithFabIcon(
            pathImage: "assets/img/mountain.jpeg",
            icondata: Icons.favorite_border,
            width: width,
            height: heigth,
            left: left,
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/mountain_stars.jpeg",
            icondata: Icons.favorite_border,
            width: width,
            height: heigth,
            left: left,
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/river.jpeg",
            icondata: Icons.favorite_border,
            width: width,
            height: heigth,
            left: left,
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/sunset.jpeg",
            icondata: Icons.favorite_border,
            width: width,
            height: heigth,
            left: left,
          ),
        ],
      ),
    );
  }
}
