
import 'package:flutter/material.dart';
import 'package:smartambulance_user2/ui/hospitalList.dart';
import 'settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
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
                   decoration: InputDecoration(
                  hintText: "Adress",
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
                   decoration: InputDecoration(
                  hintText: "What is your urgency?",
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
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Call Ambulance'),
              color: Colors.red,
              
            ),
           
           
          ],
        ),
      ),
    );
  }

/*
  Widget buildButtonContainer(){
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFFFB415B),
            Color(0xFFEE5623)
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
        ),
      ),
      child: Center(
        child:RaisedButton(  
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'), 
              color: Colors.red,
              
            ),
     
      ),
    );

  }*/
}
     