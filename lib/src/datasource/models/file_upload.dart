import 'dart:convert';

class FileUpload {
  final String fileCniFrontName;
  final String fileCniBackName;
  final String fileWedCertificateName;
  final String filePassportIdentityName;
  final String filePassportVisaName;
  final String fileResidencePermitName;
  final String fileActeName;
  FileUpload({
    required this.fileCniFrontName,
    required this.fileCniBackName,
    required this.fileWedCertificateName,
    required this.filePassportIdentityName,
    required this.filePassportVisaName,
    required this.fileResidencePermitName,
    required this.fileActeName,
  });

  FileUpload copyWith({
    String? fileCniFrontName,
    String? fileCniBackName,
    String? fileWedCertificateName,
    String? filePassportIdentityName,
    String? filePassportVisaName,
    String? fileResidencePermitName,
    String? fileActeName,
  }) {
    return FileUpload(
      fileCniFrontName: fileCniFrontName ?? this.fileCniFrontName,
      fileCniBackName: fileCniBackName ?? this.fileCniBackName,
      fileWedCertificateName:
          fileWedCertificateName ?? this.fileWedCertificateName,
      filePassportIdentityName:
          filePassportIdentityName ?? this.filePassportIdentityName,
      filePassportVisaName: filePassportVisaName ?? this.filePassportVisaName,
      fileResidencePermitName:
          fileResidencePermitName ?? this.fileResidencePermitName,
      fileActeName: fileActeName ?? this.fileActeName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id_card_1_url': fileCniFrontName,
      'user_id_card_2_url': fileCniBackName,
      'user_wedding_certificate_url': fileWedCertificateName,
      'user_passport_1_url': filePassportIdentityName,
      'user_passport_2_url': filePassportVisaName,
      'user_proof_of_stay_url': fileResidencePermitName,
      'user_birthday_certificate_url': fileActeName,
    };
  }

  factory FileUpload.fromMap(Map<String, dynamic> map) {
    return FileUpload(
      fileCniFrontName: map['user_id_card_1_url'] as String,
      fileCniBackName: map['user_id_card_2_url'] as String,
      fileWedCertificateName: map['user_wedding_certificate_url'] as String,
      filePassportIdentityName: map['user_passport_1_url'] as String,
      filePassportVisaName: map['user_passport_2_url'] as String,
      fileResidencePermitName: map['user_proof_of_stay_url'] as String,
      fileActeName: map['user_birthday_certificate_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileUpload.fromJson(String source) =>
      FileUpload.fromMap(json.decode(source) as Map<String, dynamic>);
}
