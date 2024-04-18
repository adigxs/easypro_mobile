import 'dart:convert';

class RequestResponse {
  final int id;
  final String code;
  final String status;
  final String fullName;
  final String civility;
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
  final int criminalRecordNumber;
  final String postalCode;

  final String birthCertificateUrl;
  final String passportVisaPageUrl;
  final String passportUrl;
  final String proofStayCameroonUrl;
  final String cniFrontUrl;
  final String cniBackUrl;
  final String weddingCertificateUrl;

  RequestResponse({
    required this.id,
    required this.code,
    required this.status,
    required this.fullName,
    required this.civility,
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
    required this.birthCertificateUrl,
    required this.passportVisaPageUrl,
    required this.passportUrl,
    required this.proofStayCameroonUrl,
    required this.cniFrontUrl,
    required this.cniBackUrl,
    required this.weddingCertificateUrl,
  });

  RequestResponse copyWith({
    int? id,
    String? code,
    String? status,
    String? fullName,
    String? civility,
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
    int? criminalRecordNumber,
    String? postalCode,
    String? birthCertificateUrl,
    String? passportVisaPageUrl,
    String? passportUrl,
    String? proofStayCameroonUrl,
    String? cniFrontUrl,
    String? cniBackUrl,
    String? weddingCertificateUrl,
  }) {
    return RequestResponse(
      id: id ?? this.id,
      code: code ?? this.code,
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      civility: civility ?? this.civility,
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
      birthCertificateUrl: birthCertificateUrl ?? this.birthCertificateUrl,
      passportVisaPageUrl: passportVisaPageUrl ?? this.passportVisaPageUrl,
      passportUrl: passportUrl ?? this.passportUrl,
      proofStayCameroonUrl: proofStayCameroonUrl ?? this.proofStayCameroonUrl,
      cniFrontUrl: cniFrontUrl ?? this.cniFrontUrl,
      cniBackUrl: cniBackUrl ?? this.cniBackUrl,
      weddingCertificateUrl:
          weddingCertificateUrl ?? this.weddingCertificateUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'status': status,
      'fullName': fullName,
      'civility': civility,
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
      'birthCertificateUrl': birthCertificateUrl,
      'passportVisaPageUrl': passportVisaPageUrl,
      'passportUrl': passportUrl,
      'proofStayCameroonUrl': proofStayCameroonUrl,
      'cniFrontUrl': cniFrontUrl,
      'cniBackUrl': cniBackUrl,
      'weddingCertificateUrl': weddingCertificateUrl,
    };
  }

  factory RequestResponse.fromMap(Map<String, dynamic> map) {
    return RequestResponse(
      id: map['id'] as int,
      code: map['code'] as String,
      status: map['status'] as String,
      fullName: map['fullName'] as String,
      civility: map['civility'] as String,
      phoneNumber: map['phoneNumber'] as String,
      whatsappContact: map['whatsappContact'] as String,
      email: map['email'] as String,
      typeUser: map['typeUser'] as String,
      regionOfBirth: map['regionOfBirth'] as String,
      court: map['court'] as String,
      location: map['location'] as String,
      residence: map['residence'] as String,
      address: map['user_address'] ?? '//',
      contactPersonName: map['user_close_friend_number'] ?? '',
      criminalRecordNumber: map['criminalRecordNumber'] ?? 1,
      postalCode: map['user_postal_code'] ?? '//',
      birthCertificateUrl: map['birthCertificateUrl'] ?? '',
      passportVisaPageUrl: map['passportVisaPageUrl'] ?? '',
      passportUrl: map['passportUrl'] ?? '',
      proofStayCameroonUrl: map['proofStayCameroonUrl'] ?? '',
      cniFrontUrl: map['cniFrontUrl'] ?? '',
      cniBackUrl: map['cniBackUrl'] ?? '',
      weddingCertificateUrl: map['weddingCertificateUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestResponse.fromJson(String source) =>
      RequestResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
