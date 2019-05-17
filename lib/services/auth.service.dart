import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  get onGoogleCurrentUserChanged => _googleSignIn.onCurrentUserChanged;

  Future<void> signInWithGoogle() async {
    await _googleSignIn.signIn();
  }

  Future<void> signInFirebase(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOutFirebase() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }
}

final authService = AuthService();
