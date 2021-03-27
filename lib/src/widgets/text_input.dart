import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInputNew extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final TextEditingController textController;
  int maxLines = 1;

  TextInputNew({
    Key key,
    @required this.hintText,
    @required this.inputType,
    @required this.textController,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextField(
        controller: textController,
        keyboardType: inputType,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffe5e5e5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFe5e5e5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFe5e5e5),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0),
            ),
          ),
        ),
      ),
    );
  }
}
