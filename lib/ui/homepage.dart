
import 'package:flutter/material.dart';
import 'package:smartambulance_user2/states/hospitalState.dart';
import 'package:smartambulance_user2/states/mapState.dart';
import 'package:smartambulance_user2/ui/hospitalList.dart';
import 'settings.dart';
import 'package:provider/provider.dart';
import 'package:smartambulance_user2/states/authenticationState.dart';

TextEditingController _name = TextEditingController();
TextEditingController _phone = TextEditingController();
TextEditingController _address = TextEditingController();


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 final hospitalState = Provider.of<HospitalState>(context); 
    hospitalState.showHospitals();
    return   Scaffold(
       appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HospitalUI()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsUI()));},
            ),
          ],
          title: Text(
            'Smart Ambulance',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      resizeToAvoidBottomPadding: false,
      body: callAmbulance(),
    );
  }
}


class callAmbulance extends StatefulWidget{
  @override
  _callAmbulance createState() => _callAmbulance();
  
}

class _callAmbulance extends State<callAmbulance>{
  final _formKey = GlobalKey<FormState>();
  bool vertigo = false;
  bool nausea = false;
  Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {   setState(() {
              switch (title) {
                case "Vertigo":
                  vertigo = value;
                  break;
                case "Nausea":
                  nausea = value;
                  break;
              }
            });},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    final authenticationState =
        Provider.of<AuthenticationState>(context, listen: false);
        final mapState = Provider.of<MapState>(context, listen: false);
    return   Form(
       key:_formKey,
      child:  Container(
        padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           Image.asset("images/ambulance.png"),
            SizedBox(height: 50.0,),

            TextField(
                   controller: _name,
                   decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.create)
                ), 
              ),
            SizedBox(height: 20.0,),

            TextField(
                  controller: _phone,
                   decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.phone)
                ), 
              ),
            SizedBox(height: 20.0,),
             TextField(
                  controller: _address,
                   decoration: InputDecoration(
                  hintText: "Address",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.create)
                ), 
              ),
            SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
                  SizedBox(width: 20.0,),
                  checkbox("Vertigo", vertigo),   // bas donmesi
                  SizedBox(width: 20.0,),
                  checkbox("Nausea", nausea),    // mide bulantısı
            ],
          ),            
            SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: () { 
                double lat=mapState.initialPosition.latitude;
                double long=mapState.initialPosition.longitude;    
                bool isAssign=false;         
                  authenticationState.addPatientToFirebase(
                    _name,
                    _phone, 
                    _address,   
                    vertigo,   
                    nausea, 
                    lat,
                    long,
                    isAssign,                         
                  );
                   
              },
              child: Text('Call Ambulance'),
              color: Colors.red,
              
            ),
           
           
          ],
        ),
      ),
    );
  }


}
     