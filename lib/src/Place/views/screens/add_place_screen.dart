import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/Place/model/place_model.dart';
import 'package:flutter_trips_place_app/src/Place/views/widgets/card_image.dart';
import 'package:flutter_trips_place_app/src/Place/views/widgets/title_input_location.dart';
import 'package:flutter_trips_place_app/src/User/bloc_user/bloc_user.dart';
import 'package:flutter_trips_place_app/src/widgets/button_purple.dart';
import 'package:flutter_trips_place_app/src/widgets/gradient_back.dart';
import 'package:flutter_trips_place_app/src/widgets/text_input.dart';
import 'package:flutter_trips_place_app/src/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  final PickedFile image;

  const AddPlaceScreen({this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerTittlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    UserBLoC userBLoc = BlocProvider.of<UserBLoC>(context);

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 300),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                height: 45.0,
                width: 45.0,
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 45.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 65, left: 20.0, right: 10.0),
                  child: TitleHeaderNew(title: 'Add a new Place'),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              // padding: EdgeInsets.only(top:50.0),
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    left: 10.0,
                    width: 350.0,
                    height: 250.0,
                    icondata: Icons.camera_alt,
                    pathImage: (widget.image == null)
                        ? "assets/img/beach_palm.jpeg"
                        : widget.image.path,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInputNew(
                    hintText: 'Tittle',
                    inputType: null,
                    maxLines: 1,
                    textController: _controllerTittlePlace,
                  ),
                ),
                TextInputNew(
                  hintText: 'Description',
                  inputType: TextInputType.multiline,
                  maxLines: 7,
                  textController: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 80.0),
                  child: TextInputLocationNew(
                    hintText: 'Add Location',
                    iconData: Icons.location_on,
                    controller: _controllerDescriptionPlace,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: 'Add Place',
                    onPressed: () {
                      //1.Subir imagen al Firestore
                      //url-

                      //2.Cloud Firesstore
                      //Place - Title, dscription, url, userOwner,likes.

                      //Nota: Como estoy devolviendo un futuro puedo usr el metodo whemComplete().
                      userBLoc
                          .updatePlaceData(Place(
                            name: _controllerTittlePlace.text,
                            description: _controllerDescriptionPlace.text,
                            likes: 0,
                          ))
                          .whenComplete(
                            () { print('Terminado');
                            Navigator.pop(context);
                            }
                          );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
