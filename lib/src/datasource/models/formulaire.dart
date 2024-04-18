// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'formulaire.g.dart';

@HiveType(typeId: 1)
class Formulaire {
  @HiveField(0)
  String fullName;

  @HiveField(1)
  String civilitie;

  @HiveField(2)
  String born;

  @HiveField(3)
  String usager;

  @HiveField(4)
  String location;

  @HiveField(5)
  dynamic cni;

  @HiveField(6)
  dynamic acte;

  @HiveField(7)
  String email;

  @HiveField(8)
  String number;

  @HiveField(9)
  String region;

  Formulaire({
    required this.fullName,
    required this.civilitie,
    required this.born,
    required this.usager,
    required this.location,
    required this.cni,
    required this.acte,
    required this.email,
    required this.number,
    required this.region,
  });

  Formulaire copyWith({
    String? fullName,
    String? civilitie,
    String? born,
    String? usager,
    String? location,
    dynamic cni,
    dynamic acte,
    String? email,
    String? number,
    String? region,
  }) {
    return Formulaire(
      fullName: fullName ?? this.fullName,
      civilitie: civilitie ?? this.civilitie,
      born: born ?? this.born,
      usager: usager ?? this.usager,
      location: location ?? this.location,
      cni: cni ?? this.cni,
      acte: acte ?? this.acte,
      email: email ?? this.email,
      number: number ?? this.number,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'civilitie': civilitie,
      'born': born,
      'usager': usager,
      'location': location,
      'cni': cni,
      'acte': acte,
      'email': email,
      'number': number,
      'region': region,
    };
  }

  factory Formulaire.fromMap(Map<String, dynamic> map) {
    return Formulaire(
      fullName: map['fullName'] as String,
      civilitie: map['civilitie'] as String,
      born: map['born'] as String,
      usager: map['usager'] as String,
      location: map['location'] as String,
      cni: map['cni'] as dynamic,
      acte: map['acte'] as dynamic,
      email: map['email'] as String,
      number: map['number'] as String,
      region: map['region'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Formulaire.fromJson(String source) =>
      Formulaire.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Formulaire(fullName: $fullName, civilitie: $civilitie, born: $born, usager: $usager, location: $location, cni: $cni, acte: $acte, email: $email, number: $number, region: $region)';
  }

  @override
  bool operator ==(covariant Formulaire other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.civilitie == civilitie &&
        other.born == born &&
        other.usager == usager &&
        other.location == location &&
        other.cni == cni &&
        other.acte == acte &&
        other.email == email &&
        other.number == number &&
        other.region == region;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        civilitie.hashCode ^
        born.hashCode ^
        usager.hashCode ^
        location.hashCode ^
        cni.hashCode ^
        acte.hashCode ^
        email.hashCode ^
        number.hashCode ^
        region.hashCode;
  }
}
