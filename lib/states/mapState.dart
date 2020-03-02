import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locationa;
import 'package:flutter/widgets.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:smartambulance_user2/requests/google_request.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:smartambulance_user2/src/convertToLatLng.dart';
import 'package:smartambulance_user2/src/decodePoly.dart';
import 'package:smartambulance_user2/states/crudState.dart';

const _apiKey = "AIzaSyDjJdyuszYbdiK3eW6OFyx9uyNszjPBlyk";

class MapState with ChangeNotifier {
  static LatLng _initialPosition;

  CRUDState crudState = new CRUDState();
  GoogleMapController _mapController;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  locationa.Location location = new locationa.Location();
  TextEditingController destinationController = TextEditingController();
  GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: _apiKey);
  DecodePoly decode = new DecodePoly();
  ConvertToLatLng convert = new ConvertToLatLng();

  LatLng get initialPosition => _initialPosition;
  String get apiKey => _apiKey;
  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  GoogleMapController get mapController => _mapController;
  Firestore fireStore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();


  MapState() {
    getUserLocation();
  }

  getUserLocation() async {
    var pos = await location.getLocation();
    _initialPosition = LatLng(pos.latitude, pos.longitude);

    notifyListeners();
  }









}
