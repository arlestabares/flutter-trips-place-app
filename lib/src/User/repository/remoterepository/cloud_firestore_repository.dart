import 'package:flutter_trips_place_app/src/Place/model/place_model.dart';
import 'package:flutter_trips_place_app/src/User/model/user_model.dart';
import 'package:flutter_trips_place_app/src/User/repository/remoterepository/cloud_firestore_api.dart';

//
class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFireStoreAPI();

  void updateUserDataRepository(User user) => _cloudFirestoreAPI.updateUserData(user);

//Retornamos algo de tipo CloudFirestore cuando invoquemos a este future updatePlacedata
  Future<void> updatePlaceDataCloudFirestoreRepository(Place place) => _cloudFirestoreAPI.updatePlacedata(place);
}
