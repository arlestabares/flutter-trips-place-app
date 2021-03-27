import 'package:flutter/material.dart';
import 'package:flutter_trips_place_app/src/Place/views/screens/home_strips.dart';
import 'package:flutter_trips_place_app/src/Place/views/screens/search_trips.dart';
import 'package:flutter_trips_place_app/src/User/views/screens/profile_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlatziTrips();
  }

}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index){

    setState(() {
      indexTap = index;
    });

  }

  @override
  Widget build(BuildContext context) {


    return

      Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: ''
              ),
            ]
        ),
      ),
    );
  }

}