import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playground_flutter/services/auth.service.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({Key key}) : super(key: key);

  @override
  _GoogleAuthState createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://secureservercdn.net/160.153.137.153/2xp.765.myftpupload.com/wp-content/uploads/2016/02/3D-Abstract-Art-Dark-Cubes-Wall-iPhone-6-Plus-HD-Wallpaper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: authService.onGoogleCurrentUserChanged,
              builder: (BuildContext context,
                  AsyncSnapshot<GoogleSignInAccount> snapshot) {
                if (snapshot.hasData) {
                  return SignInButton(
                    Buttons.Google,
                    text: "Logout ( ${snapshot.data.email} )",
                    onPressed: () async {
                      await authService.signOutGoogle();
                    },
                  );
                }

                return SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () async {
                    await authService.signInWithGoogle();
                  },
                );
              },
            ),
            StreamBuilder(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder:
                  (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.hasData) {
                  return SignInButtonBuilder(
                    text: "Logout ( ${snapshot.data.email} )",
                    icon: Icons.email,
                    onPressed: () async {
                      await authService.signOutFirebase();
                    },
                    backgroundColor: Colors.blueGrey[700],
                  );
                }

                return SignInButtonBuilder(
                  text: 'Sign in with Email',
                  icon: Icons.email,
                  onPressed: () async {
                    await authService.signInFirebase(
                        "test@gmail.com", "test123");
                  },
                  backgroundColor: Colors.blueGrey[700],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
