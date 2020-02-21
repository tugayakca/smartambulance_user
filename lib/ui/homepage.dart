import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:smart_ambulance/model/authentication.dart';
//import 'package:smart_ambulance/states/authenticationState.dart';
//import 'package:multi_page_form/multi_page_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*
TextEditingController _newEmailController = TextEditingController();
TextEditingController _newPhoneController = TextEditingController();
TextEditingController _newNameController = TextEditingController();
TextEditingController _newPasswordController = TextEditingController();
TextEditingController _newTcController = TextEditingController();
TextEditingController _newAmbulancePlateController = TextEditingController();
TextEditingController _newVehicleLicenceController = TextEditingController();
TextEditingController _newVehicleLicenceDateController =
    TextEditingController(); */

//Authentication model = new Authentication();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Signup Page',
        style: TextStyle(
          fontSize: 16,
        ),
      )),
      body: Test2(),
    );
  }
}

class Test2 extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<Test2> {
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: StreamBuilder(stream: Firestore.instance.collection('users').snapshots(), builder: (context,snapshots){
        if(!snapshots.hasData) return Text("Loading");
        return Text(snapshots.data.documents[0]['name'] );
      }),
    );
    
 
  }

} 