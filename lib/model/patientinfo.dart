import 'dart:convert';

class Patient {

  String name;
  dynamic position;
  String phone;
  String   vertigo;
  String   nausea;
  String   address;
  Patient({
    this.name,
    this.position,
    this.phone,
    this.vertigo,
    this.nausea,
    this.address,
  });


  Patient copyWith({
    String name,
    dynamic position,
    String phone,
    String vertigo,
    String nausea,
    String address,
  }) {
    return Patient(
      name: name ?? this.name,
      position: position ?? this.position,
      phone: phone ?? this.phone,
      vertigo: vertigo ?? this.vertigo,
      nausea: nausea ?? this.nausea,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'position': position,
      'phone': phone,
      'vertigo': vertigo,
      'nausea': nausea,
      'address': address,
    };
  }

  static Patient fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Patient(
      name: map['name'],
      position: map['position'],
      phone: map['phone'],
      vertigo: map['vertigo'],
      nausea: map['nausea'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  static Patient fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Patient name: $name, position: $position, phone: $phone, vertigo: $vertigo, nausea: $nausea, address: $address';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Patient &&
      o.name == name &&
      o.position == position &&
      o.phone == phone &&
      o.vertigo == vertigo &&
      o.nausea == nausea &&
      o.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      position.hashCode ^
      phone.hashCode ^
      vertigo.hashCode ^
      nausea.hashCode ^
      address.hashCode;
  }
}
