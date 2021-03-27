import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/Place/views/screens/add_place_screen.dart';
import 'package:flutter_trips_place_app/src/User/bloc_user/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  //final ImagePicker _imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    //
    UserBLoC userBloc = BlocProvider.of(context);

    //
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            //Cambiar contrasena
            CircleButton(true, Icons.vpn_key, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            //Anadir un nuevo lugar
            CircleButton(
                false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () {
              ImagePicker()
                  .getImage(source: ImageSource.camera)
                  .then((PickedFile image) {
                if (image != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddPlaceScreen(image: image)),
                  );
                }
              });
            }),
            //Cerrar Sesion
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                Color.fromRGBO(255, 255, 255, 0.6),
                () => {
                      userBloc.singOut(),
                    })
          ],
        ));
  }
}
