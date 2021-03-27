import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_trips_place_app/src/User/repository/remoterepository/firebase_auth_api.dart';

class AuthRepository {
//final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<auth.User> signInFirebase() => _firebaseAuthAPI.signIn();

  signOutGoogle() => _firebaseAuthAPI.signOutGoogle();
}
