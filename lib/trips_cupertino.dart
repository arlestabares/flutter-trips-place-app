import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/Place/views/screens/home_strips.dart';
import 'package:flutter_trips_place_app/src/Place/views/screens/search_trips.dart';
import 'package:flutter_trips_place_app/src/User/bloc_user/bloc_user.dart';
import 'package:flutter_trips_place_app/src/User/views/screens/profile_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class TripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.indigo), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.indigo), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.indigo), label: ''),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(builder: (BuildContext context) {
                return BlocProvider<UserBLoC>(
                  bloc: UserBLoC(),
                  child: ProfileTrips(),
                );
              });
              break;
          }
          return CupertinoTabView();
        },
      ),
    );
  }
}
