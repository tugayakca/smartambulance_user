import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartambulance_user2/states/authenticationState.dart';
import 'package:smartambulance_user2/ui/authentication/signInPage.dart';
import 'package:smartambulance_user2/ui/homepage.dart';
import 'package:provider/provider.dart';
import 'package:smartambulance_user2/states/hospitalState.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authenticationState = Provider.of<AuthenticationState>(context); 
    final hospitalState = Provider.of<HospitalState>(context);   
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return SignInPage();
          }
          // If user is online MapState.uid = user.uid.
          authenticationState.uid = user.uid;
          hospitalState.showHospitals();
          return HomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
