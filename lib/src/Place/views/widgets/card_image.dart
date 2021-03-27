import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double width;
  final double height;
  final double left;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData icondata;

  CardImageWithFabIcon({
    Key key,
    @required this.pathImage,
    this.width,
    this.height,
    this.left,
    this.onPressedFabIcon,
    @required this.icondata,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: 0.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          
          //Dejamos el AssetImage, ya que si le ponemos el NetworkImage genera error.
          image: AssetImage(pathImage),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0),
          )
        ],
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: icondata,
          onPressed: onPressedFabIcon,
        ),
      ],
    );
  }
}
