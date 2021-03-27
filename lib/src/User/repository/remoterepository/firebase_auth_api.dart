import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<auth.User> signIn() async {
    //Definimos la primera autenticacion con google.
    // Trigger the Google Authentication flow.
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

    //Definimos la segunda autenticacion con firebase.
    // Create a new credential.
    final auth.GoogleAuthCredential googleAuthCredential =
        auth.GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Sign in to Firebase with the Google [UserCredential].
    final auth.UserCredential googleUserCredential =
        await _auth.signInWithCredential(googleAuthCredential);

    return googleUserCredential.user;
  }

  signOutGoogle() async {
    await _auth.signOut().then((value) => print('Sesion cerrada'));

    //Cerramos la sesion en Google.
    googleSignIn.signOut();
    print('Sesiones Cerradas');
  }
}
