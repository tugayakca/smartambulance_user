import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartambulance_user2/model/patientinfo.dart';
import 'package:smartambulance_user2/services/FirebaseApi.dart';
import 'package:smartambulance_user2/model/hospitalsInfo.dart';

class CRUDState  {

   FirebaseApi _firebaseApi2 = new FirebaseApi('hospitalsInfo');
   FirebaseApi _firebaseApi3 = new FirebaseApi('ambulanceInfo');
   FirebaseApi _firebaseApi4 = new FirebaseApi('patientInfo');
  


  List<HospitalsInfo> hospitals;
  List<Patient> patient;



    Future<List<HospitalsInfo>> fetchHospitals() async {
    var result = await _firebaseApi2.getDataCollection();
    hospitals = result.documents
        .map((doc) => HospitalsInfo.fromMap(doc.data))
        .toList();
    return hospitals;
  }

  Future<List<Patient>> fetchPatient() async{
    var result = await _firebaseApi4.getDataCollection();
    patient=result.documents.map((doc)=> Patient.fromMap(doc.data)).toList();
    return patient;
  }





   Future addHospital(HospitalsInfo data,String id) async{
    var result  = await _firebaseApi2.addDocument2(data.toMap(),id);
    return result;
  }

  Future addPatient(Patient data , String id) async{
    var result = await _firebaseApi4.addDocument(data.toMap(), id);
    return result;
  }


}

