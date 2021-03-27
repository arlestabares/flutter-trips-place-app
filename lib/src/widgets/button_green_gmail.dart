import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonGreenGmail extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const ButtonGreenGmail({
    Key key,
    this.width,
    this.height,
    @required this.text,
    @required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  _ButtonGreenGmailState createState() => _ButtonGreenGmailState();
}

class _ButtonGreenGmailState extends State<ButtonGreenGmail> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          gradient: LinearGradient(
              colors: [
                //Color(0xff4268D3),
                //Color(0xff584CD1),
                Color(0xffa7ff84),
                Color(0xff1cbb78),
              ],
              begin: FractionalOffset(0.2, 00),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.google, color: Colors.white),
              SizedBox(width:20),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Lato',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
