import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_trips_place_app/src/Place/model/place_model.dart';
import 'package:flutter_trips_place_app/src/User/model/user_model.dart';
import 'package:flutter_trips_place_app/src/User/repository/remoterepository/auth_repository.dart';
import 'package:flutter_trips_place_app/src/User/repository/remoterepository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

//La responsabilidad de este BLoC es manejar los casos de uso del usuario.
class UserBLoC implements Bloc {
  final _authRepository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //Firebase ya viene preparado para con  un metodo especifico que nos devuelve un stream.
  //si no lo tuviera definiriamos un
  //StreamController.

  Stream<auth.User> streamFirebase =
      auth.FirebaseAuth.instance.authStateChanges();

  //Devuelve el estado de la sesion.
  Stream<auth.User> get authStatus => streamFirebase;

  //

//Casos de usu del objeto user.
//1. SignIn a la aplicacion Google
  Future<auth.User> signIn() =>_authRepository.signInFirebase();
  

//2. Registrar usuario en base de datos
final _cloudFirestoreReposiory = CloudFirestoreRepository();
void updateUserData(User user)  => _cloudFirestoreReposiory.updateUserDataRepository(user);
Future<void> updatePlaceData(Place place) => _cloudFirestoreReposiory.updatePlaceDataCloudFirestoreRepository(place);



//Metodo que cierra la sesion de Google.
  singOut() {
    _authRepository.signOutGoogle();
  }

  @override
  void dispose() {}
}
