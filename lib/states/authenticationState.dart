import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:smartambulance_user2/model/patientinfo.dart';

import 'package:smartambulance_user2/states/crudState.dart';

class AuthenticationState with ChangeNotifier {
  bool isOnline = true;
  CRUDState crudState = new CRUDState();

  String uid;
  String get uids => uid;
  

   Future<void> addPatientToFirebase(dynamic context ,TextEditingController name, TextEditingController phone,TextEditingController address, bool vertigo,bool nausea,bool blood_pressure,bool diabetes, bool heart_disease , double latitude,double long,bool isAssign ) async {
    Patient patient = new Patient(
        name: name.text,
        phone: phone.text,
        address:address.text,
        vertigo: vertigo.toString(),
        nausea: nausea.toString(),
        blood_pressure: blood_pressure.toString(),
        diabetes: diabetes.toString(),
        heart_disease: heart_disease.toString(),
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


}

