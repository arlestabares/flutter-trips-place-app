import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_trips_place_app/src/Place/model/place_model.dart';
import 'package:flutter_trips_place_app/src/User/model/user_model.dart'
    as userModel;

class CloudFireStoreAPI {
  final String USERS = 'users';
  final String PLACES = 'places';

  final FirebaseFirestore firestoreDB = FirebaseFirestore.instance;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  void updateUserData(userModel.User user) async {
    DocumentReference users = firestoreDB.collection(USERS).doc(user.uid);

    return users.set({
      'iud': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myfavoriteplaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    });
  }

  Future<void> updatePlacedata(Place place) async {
    CollectionReference refPlaces = firestoreDB.collection(PLACES);
    auth.User user = _auth.currentUser;
    //Consultando el user logueado.

    await refPlaces.add(//definimos los  keys de la data 
      {
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        'userOwner': "$USERS/${user.uid}"
      },
    );
  }
}



//aqui un ejemplo de codigo, que antes de registrar en Firestore 
//verifica si el usuario existe.

// void updateUserData(User user) async{
// 
    // DocumentReference documentReference = _db.collection(USERS).doc(user.uid);
// 
      // documentReference.get().then((userId) {
        // if(!userId.exists) {
          // return documentReference.set({
            // 'iud': user.uid,
            // 'name': user.name,
            // 'email': user.email,
            // 'photoUrl': user.photoUrl,
            // 'lastSignIn': DateTime.now(),
            // },
          // );
        // }
        // }
      // });
  // i}