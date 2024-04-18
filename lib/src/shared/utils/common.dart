import 'package:easy_pro/src/datasource/models/dropdown_model.dart';
import 'package:easy_pro/src/shared/utils/mocks.dart';
import 'package:flutter/material.dart';

String birthCertificateFiles = "birth_certificate_files";
String passportFiles = "passport_files";
String passportVisaPageFiles = "passport_visa_page_files";
String proofofStayInCameroonFiles = "proof_of_stay_in_cameroon_files";
String cniBackFiles = "cni_back_files";
String cniFrontFiles = "cni_frint_files";
String weddingCertificatFiles = "wedding_certificat_files";

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('FF');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Color colorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return const Color(0xFF008000);
}

final List<DropdownModel> civilites = [
  DropdownModel(value: 'Sélectionner', name: 'Sélectionner'),
  DropdownModel(value: 'Madame', name: 'Madame'),
  DropdownModel(value: 'Mademoiselle', name: 'Mademoiselle'),
  DropdownModel(value: 'Monsieur', name: 'Monsieur'),
];

final List<DropdownModel> requestStatus = [
  DropdownModel(value: 'Sélectionner', name: 'Sélectionner'),
  DropdownModel(value: 'STARTED', name: 'Soumis'),
  DropdownModel(value: 'STARTED', name: 'Payé'),
  DropdownModel(value: 'COMMITED', name: 'Initié'),
  DropdownModel(value: 'REJECTED', name: 'Rejeté'),
  DropdownModel(value: 'INCORRECT', name: 'Erroné'),
  DropdownModel(value: 'COMPLETED', name: 'Établi'),
  DropdownModel(value: 'SHIPPED', name: 'Expédié'),
  DropdownModel(value: 'RECEIVED', name: 'Réceptionné'),
  DropdownModel(value: 'DELIVERED', name: 'Livré'),
];

final List<DropdownModel> maritalStatus = [
  DropdownModel(value: 'Sélectionner', name: 'Sélectionner'),
  DropdownModel(value: 'Célibataire', name: 'Célibataire'),
  DropdownModel(value: 'Marié(e)', name: 'Marié(e)'),
];

final List<DropdownModel> iam = [
  DropdownModel(
      value: 'CAMEROUNAIS de l\'INTERIEUR né au Cameroun',
      name: 'CAMEROUNAIS de l\'INTERIEUR né au Cameroun'),
  DropdownModel(
      value: 'CAMEROUNAIS de l\'INTERIEUR né à l\'ETRANGER',
      name: 'CAMEROUNAIS de l\'INTERIEUR né à l\'ETRANGER'),
  DropdownModel(
      value: 'CAMEROUNAIS de l\'INTERIEUR né au Cameroun (DIASPORA)',
      name: 'CAMEROUNAIS de l\'INTERIEUR né au Cameroun (DIASPORA)'),
  DropdownModel(
      value:
          'CAMEROUNAIS de l\'ETRANGER né à l\'ETRANGER AYANT VECU au Cameroun (DIASPORA)',
      name:
          'CAMEROUNAIS de l\'ETRANGER né à l\'ETRANGER AYANT VECU au Cameroun (DIASPORA)'),
  DropdownModel(
      value:
          'CAMEROUNAIS D\'ORIGINE AYANT ACQUIS UNE  OU D\'AUTRES NATIONALITE (S)',
      name:
          'CAMEROUNAIS D\'ORIGINE AYANT ACQUIS UNE  OU D\'AUTRES NATIONALITE (S)'),
  DropdownModel(
      value: 'ETRANGER Né au Cameroun, vivant au Cameroun',
      name: 'ETRANGER Né au Cameroun, vivant au Cameroun'),
  DropdownModel(
      value: 'ETRANGER Né au Cameroun, vivant A L\'ETRANGER',
      name: 'ETRANGER Né au Cameroun, vivant A L\'ETRANGER'),
  DropdownModel(
      value: 'ETRANGER Né à l\'ETRANGER, ayant vécu au Cameroun',
      name: 'ETRANGER Né à l\'ETRANGER, ayant vécu au Cameroun'),
  DropdownModel(
      value: 'FONCTIONNAIRE INTERNATIONAL AYANT VECU OU TRAVAILLE AU CAMEROUN',
      name: 'FONCTIONNAIRE INTERNATIONAL AYANT VECU OU TRAVAILLE AU CAMEROUN'),
  DropdownModel(
      value: 'DIPLOMATE AYANT VECU OU TRAVAILLE AU CAMEROUN',
      name: 'DIPLOMATE AYANT VECU OU TRAVAILLE AU CAMEROUN'),
];

final List<DropdownModel> city = [
  DropdownModel(
      value: 'Je suis né(e) HORS DU CAMEROUN',
      name: 'Je suis né(e) HORS DU CAMEROUN'),
  DropdownModel(
      value: 'ABONG-MBANG (Départ du Haut-Nyong - EST)',
      name: 'ABONG-MBANG (Départ du Haut-Nyong - EST)'),
  DropdownModel(
      value: 'AKONOLINGA (Dépt du Nyong-et-Mfoumou - CENTRE)',
      name: 'AKONOLINGA (Dépt du Nyong-et-Mfoumou - CENTRE)'),
  DropdownModel(
      value: 'AMBAM (Départ de la Vallée-du-Ntem - SUD)',
      name: 'AMBAM (Départ de la Vallée-du-Ntem - SUD)'),
  DropdownModel(
      value: 'BAFANG (Départ du Haut-Nkam - OUEST)',
      name: 'BAFANG (Départ du Haut-Nkam - OUEST)'),
  DropdownModel(
      value: 'BAFIA (Départ du Mbam-et-Inoubou - CENTRE)',
      name: 'BAFIA (Départ du Mbam-et-Inoubou - CENTRE)'),
  DropdownModel(
      value: 'BAFOUSSAM (Départ de la Mifi - OUEST)',
      name: 'BAFOUSSAM (Départ de la Mifi - OUEST)'),
  DropdownModel(
      value: 'BAHAM (Départ des Hauts-Plateaux - OUEST)',
      name: 'BAHAM (Départ des Hauts-Plateaux - OUEST)'),
  DropdownModel(
      value: 'BALI (Mezam-Division - NORTH-WEST)',
      name: 'BALI (Mezam-Division - NORTH-WEST)'),
  DropdownModel(
      value: 'BAMENDA (Mezam-Division - NORTH-WEST)',
      name: 'BAMENDA (Mezam-Division - NORTH-WEST)'),
  DropdownModel(
      value: 'BANDJOUN (Départ du Koung-Khi - OUEST)',
      name: 'BANDJOUN (Départ du Koung-Khi - OUEST)'),
  DropdownModel(
      value: 'BANGANGTE (Départ du Ndé - OUEST)',
      name: 'BANGANGTE (Départ du Ndé - OUEST)'),
  DropdownModel(
      value: 'BANGUEM (Koupé-Manengouba Division - SOUTH-WEST)',
      name: 'BANGUEM (Koupé-Manengouba Division - SOUTH-WEST)'),
  DropdownModel(
      value: 'BANYO (Départ du Mayo-Banyo - ADAMAOUA)',
      name: 'BANYO (Départ du Mayo-Banyo - ADAMAOUA)'),
  DropdownModel(
      value: 'BATIBO (Momo Division - NORTH-WEST)',
      name: 'BATIBO (Momo Division - NORTH-WEST)'),
  DropdownModel(
      value: 'BATOURI (Départ de la Kadey - EST)',
      name: 'BATOURI (Départ de la Kadey - EST)'),
  DropdownModel(
      value: 'BENGBIS (Départ du Dja-et-Lobo - SUD)',
      name: 'BENGBIS (Départ du Dja-et-Lobo - SUD)'),
  DropdownModel(
      value: 'BERTOUA (Départ du Lom-et-Djérem - EST)',
      name: 'BERTOUA (Départ du Lom-et-Djérem - EST)'),
  DropdownModel(
      value: 'BUEA (Fako Dvision - SOUTH-WEST)',
      name: 'BUEA (Fako Dvision - SOUTH-WEST)'),
  DropdownModel(
      value: 'DJOUM (Départ du Dja-et-Lobo - SUD)',
      name: 'DJOUM (Départ du Dja-et-Lobo - SUD)'),
  DropdownModel(
      value: 'DOUALA-BONABERI (Départ du Wouri - LITTORAL)',
      name: 'DOUALA-BONABERI (Départ du Wouri - LITTORAL)'),
  DropdownModel(
      value: 'DOUALA-BONANJO (Départ du Wouri - LITTORAL)',
      name: 'DOUALA-BONANJO (Départ du Wouri - LITTORAL)'),
  DropdownModel(
      value: 'DOUALA-NDOKOTI (Départ du Wouri - LITTORAL)',
      name: 'DOUALA-NDOKOTI (Départ du Wouri - LITTORAL)'),
  DropdownModel(
      value: 'DOUKOULA (Départ du Mayo-Danay - EXTREME-NORD)',
      name: 'DOUKOULA (Départ du Mayo-Danay - EXTREME-NORD)'),
  DropdownModel(
      value: 'DSCHANG (Départ de la Menoua - OUEST)',
      name: 'DSCHANG (Départ de la Menoua - OUEST)'),
  DropdownModel(
      value: 'EBOLOWA (Départ de la Mvila - SUD)',
      name: 'EBOLOWA (Départ de la Mvila - SUD)'),
  DropdownModel(
      value: 'EDEA (Départ de la Sanaga-Maritime - LITTORAL)',
      name: 'EDEA (Départ de la Sanaga-Maritime - LITTORAL)'),
  DropdownModel(
      value: 'ESEKA (Départ du Nyong-et-Kellé - CENTRE)',
      name: 'ESEKA (Départ du Nyong-et-Kellé - CENTRE)'),
  DropdownModel(
      value: 'FOUMBAN (Départ du Noun - OUEST)',
      name: 'FOUMBAN (Départ du Noun - OUEST)'),
  DropdownModel(
      value: 'FOUMBOT (Départ du Noun - OUEST)',
      name: 'FOUMBOT (Départ du Noun - OUEST)'),
  DropdownModel(
      value: 'KUMBA (MéMé Division - SOUTH-WEST)',
      name: 'KUMBA (MéMé Division - SOUTH-WEST)'),
  DropdownModel(
      value: 'FUNDONG (Boyo Division - NORTH-WEST)',
      name: 'FUNDONG (Boyo Division - NORTH-WEST)'),
  DropdownModel(
      value: 'GAROUA (Départ de la Bénoué - NORD)',
      name: 'GAROUA (Départ de la Bénoué - NORD)'),
  DropdownModel(
      value: 'GUIDER (Départ mayo-Louti - NORD)',
      name: 'GUIDER (Départ mayo-Louti - NORD)'),
  DropdownModel(
      value: 'KAELE (Départ Mayo-Kani - EXTREME-NORD)',
      name: 'KAELE (Départ Mayo-Kani - EXTREME-NORD)'),
  DropdownModel(
      value: 'KOUSSERI (Départ du Logone-et-Chari - EXTREME-NORD)',
      name: 'KOUSSERI (Départ du Logone-et-Chari - EXTREME-NORD'),
  DropdownModel(
      value: 'KRIBI (Départ de l\'Océan - SUD)',
      name: 'KRIBI (Départ de l\'Océan - SUD)'),
  DropdownModel(
      value: 'KUMBO (Bui Division - NORTH-WEST)',
      name: 'KUMBO (Bui Division - NORTH-WEST)'),
  DropdownModel(
      value: 'LIMBE (Fako Dvision - SOUTH-WEST)',
      name: 'LIMBE (Fako Dvision - SOUTH-WEST)'),
  DropdownModel(
      value: 'MAMFE (Manyu Division - SOUTH-WEST)',
      name: 'MAMFE (Manyu Division - SOUTH-WEST)'),
  DropdownModel(
      value: 'MAKARY (Départ du Logone-et-Chari - EXTREME-NORD)',
      name: 'MAKARY (Départ du Logone-et-Chari - EXTREME-NORD)'),
  DropdownModel(
      value: 'MAROUA (Départ du Diamaré - EXTREME-NORD)',
      name: 'MAROUA (Départ du Diamaré - EXTREME-NORD)'),
  DropdownModel(
      value: 'MBALMAYO (Départ du Nyong-et-So\'o - CENTRE)',
      name: 'MBALMAYO (Départ du Nyong-et-So\'o - CENTRE)'),
  DropdownModel(
      value: 'MBANGA (Départ du Moungo - LITTORAL)',
      name: 'MBANGA (Départ du Moungo - LITTORAL)'),
  DropdownModel(
      value: 'MBENGWI (Momo Division - NORTH-WEST)',
      name: 'MBENGWI (Momo Division - NORTH-WEST)'),
  DropdownModel(
      value: 'MBOUDA (Départ des Bamboutos - OUEST)',
      name: 'MBOUDA (Départ des Bamboutos - OUEST)'),
  DropdownModel(
      value: 'MEIGANGA (Départ du Mbéré - ADAMAOUA)',
      name: 'MEIGANGA (Départ du Mbéré - ADAMAOUA)'),
  DropdownModel(
      value: 'MENJI (Lebialem Division - SOUTH-WEST)',
      name: 'MENJI (Lebialem Division - SOUTH-WEST)'),
  DropdownModel(
      value: 'MFOU (Départ de la Mefou-et-Afamba - CENTRE)',
      name: 'MFOU (Départ de la Mefou-et-Afamba - CENTRE)'),
  DropdownModel(
      value: 'MOKOLO (Départ du Mayo-Tsanaga - EXTREME-NORD)',
      name: 'MOKOLO (Départ du Mayo-Tsanaga - EXTREME-NORD)'),
  DropdownModel(
      value: 'MONATELE (Départ de la Lékié - CENTRE)',
      name: 'MONATELE (Départ de la Lékié - CENTRE)'),
  DropdownModel(
      value: 'MORA (Départ Mayo-Sava - EXTREME-NORD)',
      name: 'MORA (Départ Mayo-Sava - EXTREME-NORD)'),
  DropdownModel(
      value: 'MUNDEMBA (Ndian Division - SOUTH-WEST)',
      name: 'MUNDEMBA (Ndian Division - SOUTH-WEST)'),
  DropdownModel(
      value: 'MUYUKA (Fako Dvision - SOUTH-WEST)',
      name: 'MUYUKA (Fako Dvision - SOUTH-WEST)'),
  DropdownModel(
      value: 'NANGA-EBOKO (Départ du Centre - CENTRE)',
      name: 'NANGA-EBOKO (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'NDELELE (Départ du Lom-et-Djérem - EST)',
      name: 'NDELELE (Départ du Lom-et-Djérem - EST)'),
  DropdownModel(
      value: 'NGAOUNDERE (Départ du Vina - ADAMAOUA)',
      name: 'NGAOUNDERE (Départ du Vina - ADAMAOUA)'),
  DropdownModel(
      value: 'NGAOUNDERE (Départ du Vina - ADAMAOUA)',
      name: 'NGAOUNDERE (Départ du Vina - ADAMAOUA)'),
  DropdownModel(
      value: 'NKAMBE (Dongha-Mantung Division - NORTH-WEST)',
      name: 'NKAMBE (Dongha-Mantung Division - NORTH-WEST)'),
  DropdownModel(
      value: 'NKONDJOCK (Départ du Nkam - LITTORAL)',
      name: 'NKONDJOCK (Départ du Nkam - LITTORAL)'),
  DropdownModel(
      value: 'NKOULMECKOK (Départ de la Mefou-et-Afamba - CENTRE)',
      name: 'NKOULMECKOK (Départ de la Mefou-et-Afamba - CENTRE)'),
  DropdownModel(
      value: 'NOMAYOS (Départ du Nyong-et-So\'o - CENTRE)',
      name: 'NOMAYOS (Départ du Nyong-et-So\'o - CENTRE)'),
  DropdownModel(
      value: 'NOUN (Départ du Noun - OUEST)',
      name: 'NOUN (Départ du Noun - OUEST)'),
  DropdownModel(
      value: 'NTELE (Départ de la Mifi - OUEST)',
      name: 'NTELE (Départ de la Mifi - OUEST)'),
  DropdownModel(
      value: 'OBALA (Départ de la Lékié - CENTRE)',
      name: 'OBALA (Départ de la Lékié - CENTRE)'),
  DropdownModel(
      value: 'POLI (Départ du Faro - ADAMAOUA)',
      name: 'POLI (Départ du Faro - ADAMAOUA)'),
  DropdownModel(
      value: 'SANGMELIMA (Départ du Dja-et-Lobo - SUD)',
      name: 'SANGMELIMA (Départ du Dja-et-Lobo - SUD)'),
  DropdownModel(
      value: 'TCHOLLIRE (Départ de la Mayo-Kebbi - NORD)',
      name: 'TCHOLLIRE (Départ de la Mayo-Kebbi - NORD)'),
  DropdownModel(
      value: 'TIBATI (Départ de la Haute-Sanaga - CENTRE)',
      name: 'TIBATI (Départ de la Haute-Sanaga - CENTRE)'),
  DropdownModel(
      value: 'TIGNERE (Départ du Mayo-Banyo - ADAMAOUA)',
      name: 'TIGNERE (Départ du Mayo-Banyo - ADAMAOUA)'),
  DropdownModel(
      value: 'WUM (Mezam-Division - NORTH-WEST)',
      name: 'WUM (Mezam-Division - NORTH-WEST)'),
  DropdownModel(
      value: 'YABASSI (Départ du Nkam - LITTORAL)',
      name: 'YABASSI (Départ du Nkam - LITTORAL)'),
  DropdownModel(
      value: 'YAGOUA (Départ du Mayo-Danay - EXTREME-NORD)',
      name: 'YAGOUA (Départ du Mayo-Danay - EXTREME-NORD)'),
  DropdownModel(
      value: 'YAOUNDE 1 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 1 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 10 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 10 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 11 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 11 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 12 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 12 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 2 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 2 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 3 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 3 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 4 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 4 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 5 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 5 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 6 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 6 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 7 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 7 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 8 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 8 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YAOUNDE 9 (Départ du Centre - CENTRE)',
      name: 'YAOUNDE 9 (Départ du Centre - CENTRE)'),
  DropdownModel(
      value: 'YOKO (Départ de la Mvila - SUD)',
      name: 'YOKO (Départ de la Mvila - SUD)'),
  DropdownModel(
      value: 'YOSO (Départ du Nyong-et-Kellé - CENTRE)',
      name: 'YOSO (Départ du Nyong-et-Kellé - CENTRE)'),
];

final List<DropdownModel> birth =
    birthList.map((value) => DropdownModel(value: value, name: value)).toList();

final List<DropdownModel> birthCommune = birthRegionList
    .map((value) => DropdownModel(value: value['id']!, name: value['name']!))
    .toList();

final List<DropdownModel> aksDocument = [
  DropdownModel(
      value: 'EXTRAIT DE CASIER JUDICIAIRE',
      name: 'EXTRAIT DE CASIER JUDICIAIRE'),
  DropdownModel(
      value:
          'CERTIFICATE OF NON CONVICTION (Cameroonians Born in the NORTH-WEST and SOUTH-WEST Region)',
      name:
          'CERTIFICATE OF NON CONVICTION (Cameroonians Born in the NORTH-WEST and SOUTH-WEST Region)'),
];

final List<DropdownModel> typeDocument = [
  DropdownModel(
      value: 'Document  PHYSIQUE UNIQUEMENT',
      name: 'Document  PHYSIQUE UNIQUEMENT'),
  DropdownModel(
      value: 'VERSION Scannée UNIQUEMENT', name: 'VERSION Scannée UNIQUEMENT'),
];

final List<DropdownModel> casierNumber = [
  DropdownModel(value: '01', name: '01'),
  DropdownModel(value: '02', name: '02'),
  DropdownModel(value: '03', name: '03'),
  DropdownModel(value: '04', name: '04'),
  DropdownModel(value: '05', name: '05'),
  DropdownModel(value: '06', name: '06'),
];

final List<DropdownModel> reason = reasonList
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

List<Map<String, dynamic>> otherDocuments = [
  {"id": 1, "value": false, "title": "NON"},
  {"id": 2, "value": false, "title": "OUI"},
  {"id": 3, "value": false, "title": "CERTIFICAT DE NATIONALITE"},
  {"id": 4, "value": false, "title": "Photocopie légalisée ACTE DE NAISSANCE"},
  {"id": 5, "value": false, "title": "Photocopie légalisée ACTE DE MARIAGE"},
  {"id": 6, "value": false, "title": "Photocopie légalisée ACTE DE DECES"},
  {"id": 7, "value": false, "title": "Photocopie légalisée PERMIS DE CONDUIRE"},
  {
    "id": 8,
    "value": false,
    "title": "Photocopie légalisée CARTE NATIONALE D'IDENTITE"
  },
  {
    "id": 9,
    "value": false,
    "title": "Photocopie légalisée CARTE PROFESSIONNELLE"
  },
];

final List<DropdownModel> etatcivil = [
  DropdownModel(value: 'Marié', name: 'Marié'),
  DropdownModel(value: 'Célibataire', name: 'Célibataire'),
];

List<Map<String, dynamic>> extractList = [
  {"id": 1, "value": false, "title": "(Obligatoire) ACTE DE NAISSANCE"},
  {"id": 2, "value": false, "title": "(Obligatoire) CNI"},
  {
    "id": 3,
    "value": false,
    "title": "RECEPISSE LISIBLE ET VALIDE (si c'est ce que vous avez)"
  },
  {
    "id": 4,
    "value": false,
    "title": "ACTE DE MARIAGE (Obligatoire pour les Femmes mariées UNIQUEMENT)"
  },
  {"id": 5, "value": false, "title": "PASSEPORT"},
  {"id": 6, "value": false, "title": "CARTE DE SEJOUR"},
  {"id": 7, "value": false, "title": "CARTE DE RESIDENT PERMANENT"},
  {"id": 8, "value": false, "title": "CARTE PROFESSIONNELLE"},
  {"id": 9, "value": false, "title": "AUTRES"},
];

final List<DropdownModel> nationality = nationalityList
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

final List<DropdownModel> delivery = deliveryList
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

final List<DropdownModel> services = servicesList
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

final List<DropdownModel> buy =
    buyChoice.map((value) => DropdownModel(value: value, name: value)).toList();

List<Map<String, dynamic>> validateSopac = [
  {"id": 1, "value": false, "title": "OUI, JE L'ACCEPTE"},
  {"id": 2, "value": false, "title": "J'AI PRIS ACTE"},
];

List<Map<String, dynamic>> usagerType = [
  {"id": 1, "value": false, "title": "Je suis Camerounais né au Cameroun"},
  {"id": 2, "value": false, "title": "Je suis Camerounais né a l'étranger"},
  {"id": 3, "value": false, "title": "Je suis de nationalité étrangère"},
];

final List<DropdownModel> cours = coursAdamaoua
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

List<Map<String, dynamic>> buyConfirmation = [
  {"id": 1, "value": false, "title": "8 000 F CFA (Version scannée simple)"},
  {"id": 2, "value": false, "title": "10 000 F CFA (version PHYSIQUE SIMPLE)"},
  {
    "id": 3,
    "value": false,
    "title": "J'AJOUTE 4 000 F CFA PAR DOCUMENT SUPLEMENTAIRE"
  },
  {"id": 4, "value": false, "title": "100 EUROS (Europe, AFRIQUE)"},
  {"id": 5, "value": false, "title": "110 Dollars (AMERIQUES)"},
];

final List<DropdownModel> numberChoice = [
  "01",
  "02",
  "03",
  "04",
  "05",
  "06",
  "07",
  "08",
  "09",
  "10"
].map((value) => DropdownModel(value: value, name: value)).toList();

String wrapText(String input, int wordsPerLine) {
  List<String> words = input.split(' ');
  List<String> lines = [];

  for (int i = 0; i < words.length; i += wordsPerLine) {
    int end = i + wordsPerLine;
    lines.add(words.sublist(i, end).join(' '));
  }

  return lines.join('\n');
}

///TPI DropdownList
final List<DropdownModel> listCentre = coursCentre
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

final List<DropdownModel> listLittoral = coursLittoral
    .map((value) => DropdownModel(value: value, name: value))
    .toList();
final List<DropdownModel> listOuest = coursOuest
    .map((value) => DropdownModel(value: value, name: value))
    .toList();
final List<DropdownModel> listNordOuest = coursNordOuest
    .map((value) => DropdownModel(value: value, name: value))
    .toList();
final List<DropdownModel> listExtremNord = coursExtremNord
    .map((value) => DropdownModel(value: value, name: value))
    .toList();
final List<DropdownModel> listNord =
    coursNord.map((value) => DropdownModel(value: value, name: value)).toList();
final List<DropdownModel> listSud =
    coursSud.map((value) => DropdownModel(value: value, name: value)).toList();
final List<DropdownModel> listEst =
    coursEst.map((value) => DropdownModel(value: value, name: value)).toList();
final List<DropdownModel> listAdamaoua = coursAdamaoua
    .map((value) => DropdownModel(value: value, name: value))
    .toList();
final List<DropdownModel> lisSudOuest = coursSudOuest
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

final List<DropdownModel> regions = regionList
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

final List<DropdownModel> customCoursList = allCoursList
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

String generateUniqueFileName({required String path}) {
  int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;
  String uniqueFileName = '$currentTimeMillis$path';
  return uniqueFileName;
}

final List<DropdownModel> cameroonRegion = regionsCameroon
    .map((value) => DropdownModel(value: value, name: value))
    .toList();

List<String> getDepartmentsByRegion(String regionName) {
  for (var region in regionsDepartments) {
    if (region["region"] == regionName) {
      return List<String>.from(region["departments"]);
    }
  }
  return ['Sélectionner'];
}

List<String> getCourtByRegion(String regionName) {
  for (var region in regionsDepartments) {
    if (region["region"] == regionName) {
      return List<String>.from(region["court"]);
    }
  }
  return ['Sélectionner'];
}

final List<String> centralFiles = [
  "Sélectionner",
  "Fichier Central Exterieur",
  "Fichier Central NOSO"
];
