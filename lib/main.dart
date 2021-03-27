import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_trips_place_app/src/User/bloc_user/bloc_user.dart';
import 'package:flutter_trips_place_app/src/User/views/screens/sign_in_screen_main.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBLoC(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //home: PlatziTrips()
        home: SignInScreen(),
        //home: TripsCupertino(),
      ),
    );
  }
}
