import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/User/bloc_user/bloc_user.dart';
import 'package:flutter_trips_place_app/src/User/model/user_model.dart';
import 'package:flutter_trips_place_app/src/User/views/widgets/button_bar.dart';
import 'package:flutter_trips_place_app/src/User/views/widgets/user_info.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  User user;
  @override
  Widget build(BuildContext context) {
    //
    UserBLoC userBloc = BlocProvider.of<UserBLoC>(context);

    //
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return CircularProgressIndicator();

          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);

            break;
          default:
            return null;
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print('No Loguedo...');

      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text('No se pudo cargar la Informacion. Haz Login'),
          ],
        ),
      );
    } else {
      print('Logueado..');
      user = User(
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoUrl: snapshot.data.toString(),
        uid: snapshot.data.uid,
      );
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
