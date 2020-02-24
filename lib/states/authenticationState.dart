import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smartambulance_user2/model/patientinfo.dart';
import 'package:smartambulance_user2/model/users.dart';
import 'package:smartambulance_user2/states/crudState.dart';

class AuthenticationState with ChangeNotifier {
  bool isOnline = true;
  CRUDState crudState = new CRUDState();

  String uid;
  String get uids => uid;
  String smsCode;
  String verificationId;

  Future<void> signOut() async {
    try {
      isOnline = false;
      updateFirebase();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<bool> signInWithEmail(context, TextEditingController email,
      TextEditingController password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.trim().toLowerCase(), password: password.text);
      isOnline = true;
      updateFirebase();
      print('Signed in: ${result.user.uid}');
      return true;
    } catch (e) {
      print('Error: $e');

      return false;
    }
  }

  Future<bool> signUpWithEmailAndPassword(
      dynamic context,
      TextEditingController name,
      TextEditingController email,
      TextEditingController phone,
      TextEditingController tc,
      TextEditingController password,
      TextEditingController ambulancePlate,
      TextEditingController vehicleLicence,
      TextEditingController vehicleLicenceDate) async {
    try {
      /*
      if(phone.text==null){   DUZELTILECEK 
        print('HATA'); 
      }*/
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text.trim().toLowerCase(), password: password.text);
      isOnline = true;
      addToFirebase(
          email.text.trim().toLowerCase(),
          password.text,
          result.user.uid,
          name.text,
          phone.text,
          tc.text,
          ambulancePlate.text,
          vehicleLicence.text,
          vehicleLicenceDate.text);
      print('Signed up: ${result.user.uid}');
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future tryToLogInUserViaEmail(context, email, password) async {
    if (await signInWithEmail(context, email, password) == true) {
      isOnline = true;
      updateFirebase();
    } else {
      return Alert(
        context: context,
        type: AlertType.error,
        title: "Authentication Error!",
        desc: "Invalid email/username or password.",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
    notifyListeners();
  }

  Future<void> addToFirebase(email, password, uid, name, phone, tc,
      ambulancePlate, vehicleLicence, vehicleLicenceDate) async {
    User user = new User(
        mail: email,
        isOnline: true,
        name: name,
        password: password,
        role: 'user',
        uid: uid,
        phone: phone,
        tc: tc,
        ambulancePlate: ambulancePlate,
        vehicleLicence: vehicleLicence,
        vehicleLicenceDate: vehicleLicenceDate);
    crudState.addProduct(user, uid);
  }

   Future<void> addPatientToFirebase(dynamic context ,TextEditingController name, TextEditingController phone,TextEditingController address, bool vertigo,bool nausea,double latitude,double long,bool isAssign ) async {
    Patient patient = new Patient(
        name: name.text,
        phone: phone.text,
        address:address.text,
        vertigo: vertigo.toString(),
        nausea: nausea.toString(),
        latitude: latitude,
        longitude: long,
        isAssigned: isAssign,       
        );
    crudState.addPatient(patient, uid);
   return  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Call Ambulance'),
        content: const Text('Your information has been successfully received. An ambulance will arrive as soon as possible.'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
      
   }

  Future<void> updateFirebase() async {
    if (uid != 'PuFBc2GcqzaLh3gTGK8PryjDVC43' && uid != null) {
      try {
        User user = new User(isOnline: isOnline);
        crudState.updateProduct(user, uid);
      } catch (e) {
        print(e);

        // eğer id geldiyse yakala anonymous kullanıcı kaydını oluştur
        /*     await fireStore.collection('users-anonymous').document(uid).setData(
            {'uid': uid, 'name': "anonymous", 'isOnline': isOnline},
            merge: false); */

      }
    }
  }
}

