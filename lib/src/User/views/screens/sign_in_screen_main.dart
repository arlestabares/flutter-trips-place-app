import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_trips_place_app/src/User/bloc_user/bloc_user.dart';
import 'package:flutter_trips_place_app/src/User/model/user_model.dart';
import 'package:flutter_trips_place_app/src/widgets/button_green_gmail.dart';
import 'package:flutter_trips_place_app/src/widgets/gradient_back.dart';
import 'package:flutter_trips_place_app/trips_cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBLoC userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot - data - Object User
        if (!snapshot.hasData || snapshot.hasError) {
          print('Paso por StreamBuilder..... ${snapshot.data}');
          return signInGoogleUI(context);
        } else {
          print('Entro al return 222');
          return TripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            height: null,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              //Con este Flexible el texto Jamas se desbordara en diferentes plataformas.
              Flexible(
                child: Container(
                  width: width,
                  child: Text(
                    'Welcome... \n This is your Travel App',
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: 'Lato',
                      color: Colors.white,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ButtonGreenGmail(
                width: 350.0,
                height: 50.0,
                text: 'Sign in with google',
                onPressed: () {
                  userBloc.singOut();
                  userBloc.signIn().then((auth.User userFirebase) {
                    userBloc.updateUserData(
                      User(
                        uid: userFirebase.uid,
                        name: userFirebase.displayName,
                        email: userFirebase.email,
                        photoUrl: userFirebase.photoURL,
                      ),
                    );
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
