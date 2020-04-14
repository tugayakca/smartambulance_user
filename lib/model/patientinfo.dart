import 'dart:convert';

class Patient {
  String name;
  double latitude;
  double longitude;
  bool isAssigned;
  String phone;
  String vertigo;
  String nausea;
  String address;
  String blood_pressure;
  String diabetes;
  String heart_disease;
  Patient({
    this.name,
    this.latitude,
    this.longitude,
    this.isAssigned,
    this.phone,
    this.vertigo,
    this.nausea,
    this.address,
    this.blood_pressure,
    this.diabetes,
    this.heart_disease,
  });

  Patient copyWith({
    String name,
    double latitude,
    double longitude,
    bool isAssigned,
    String phone,
    String vertigo,
    String nausea,
    String address,
    String blood_pressure,
    String diabetes,
    String heart_disease,
  }) {
    return Patient(
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isAssigned: isAssigned ?? this.isAssigned,
      phone: phone ?? this.phone,
      vertigo: vertigo ?? this.vertigo,
      nausea: nausea ?? this.nausea,
      address: address ?? this.address,
      blood_pressure: blood_pressure ?? this.blood_pressure,
      diabetes: diabetes ?? this.diabetes,
      heart_disease: heart_disease ?? this.heart_disease,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'isAssigned': isAssigned,
      'phone': phone,
      'vertigo': vertigo,
      'nausea': nausea,
      'address': address,
      'blood_pressure': blood_pressure,
      'diabetes': diabetes,
      'heart_disease': heart_disease,
    };
  }

  static Patient fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Patient(
      name: map['name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      isAssigned: map['isAssigned'],
      phone: map['phone'],
      vertigo: map['vertigo'],
      nausea: map['nausea'],
      address: map['address'],
      blood_pressure: map['blood_pressure'],
      diabetes: map['diabetes'],
      heart_disease: map['heart_disease'],
    );
  }

  String toJson() => json.encode(toMap());

  static Patient fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Patient(name: $name, latitude: $latitude, longitude: $longitude, isAssigned: $isAssigned, phone: $phone, vertigo: $vertigo, nausea: $nausea, address: $address, blood_pressure: $blood_pressure, diabetes: $diabetes, heart_disease: $heart_disease)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Patient &&
      o.name == name &&
      o.latitude == latitude &&
      o.longitude == longitude &&
      o.isAssigned == isAssigned &&
      o.phone == phone &&
      o.vertigo == vertigo &&
      o.nausea == nausea &&
      o.address == address &&
      o.blood_pressure == blood_pressure &&
      o.diabetes == diabetes &&
      o.heart_disease == heart_disease;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      isAssigned.hashCode ^
      phone.hashCode ^
      vertigo.hashCode ^
      nausea.hashCode ^
      address.hashCode ^
      blood_pressure.hashCode ^
      diabetes.hashCode ^
      heart_disease.hashCode;
  }
}
