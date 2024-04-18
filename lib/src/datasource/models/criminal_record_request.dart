// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CriminalRecordRequest {
  final String civility;
  final String fullName;
  final String phoneNumber;
  final String whatsappContact;
  final String email;
  final String typeUser;
  final String regionOfBirth;
  final String court;
  final String location;
  final String residence;
  final String address;
  final String contactPersonName;
  final String criminalRecordNumber;
  final String postalCode;
  final String jobDescription;
  final String maritalStatus;
  final String deliveryAddress;
  final String placeCalled;

  CriminalRecordRequest(
      {required this.civility,
      required this.fullName,
      required this.phoneNumber,
      required this.whatsappContact,
      required this.email,
      required this.typeUser,
      required this.regionOfBirth,
      required this.court,
      required this.location,
      required this.residence,
      required this.address,
      required this.contactPersonName,
      required this.criminalRecordNumber,
      required this.postalCode,
      required this.jobDescription,
      required this.deliveryAddress,
      required this.placeCalled,
      required this.maritalStatus});

  CriminalRecordRequest copyWith({
    String? civility,
    String? fullName,
    String? phoneNumber,
    String? whatsappContact,
    String? email,
    String? typeUser,
    String? regionOfBirth,
    String? court,
    String? location,
    String? residence,
    String? address,
    String? contactPersonName,
    String? criminalRecordNumber,
    String? postalCode,
    String? jobDescription,
    String? maritalStatus,
    String? placeCalled,
    String? deliveryAddress,
  }) {
    return CriminalRecordRequest(
        civility: civility ?? this.civility,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        whatsappContact: whatsappContact ?? this.whatsappContact,
        email: email ?? this.email,
        typeUser: typeUser ?? this.typeUser,
        regionOfBirth: regionOfBirth ?? this.regionOfBirth,
        court: court ?? this.court,
        location: location ?? this.location,
        residence: residence ?? this.residence,
        address: address ?? this.address,
        contactPersonName: contactPersonName ?? this.contactPersonName,
        criminalRecordNumber: criminalRecordNumber ?? this.criminalRecordNumber,
        postalCode: postalCode ?? this.postalCode,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        placeCalled: placeCalled ?? this.placeCalled,
        jobDescription: jobDescription ?? this.jobDescription);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'civility': civility,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'whatsappContact': whatsappContact,
      'email': email,
      'typeUser': typeUser,
      'regionOfBirth': regionOfBirth,
      'court': court,
      'location': location,
      'residence': residence,
      'address': address,
      'contactPersonName': contactPersonName,
      'criminalRecordNumber': criminalRecordNumber,
      'postalCode': postalCode,
      'user_occupation': jobDescription,
      'user_marital_status': maritalStatus,
      'destination_address': deliveryAddress,
      'destination_location': placeCalled,
    };
  }

  factory CriminalRecordRequest.fromMap(Map<String, dynamic> map) {
    return CriminalRecordRequest(
      civility: map['civility'] as String,
      fullName: map['fullName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      whatsappContact: map['whatsappContact'] as String,
      email: map['email'] as String,
      typeUser: map['typeUser'] as String,
      regionOfBirth: map['regionOfBirth'] as String,
      court: map['court'] as String,
      location: map['location'] as String,
      residence: map['residence'] as String,
      address: map['address'] as String,
      contactPersonName: map['contactPersonName'] as String,
      criminalRecordNumber: map['criminalRecordNumber'] as String,
      postalCode: map['postalCode'] as String,
      jobDescription: map['user_occupation'] as String,
      maritalStatus: map['user_marital_status'] as String,
      deliveryAddress: map['destination_address'] as String,
      placeCalled: map['destination_location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CriminalRecordRequest.fromJson(String source) =>
      CriminalRecordRequest.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
