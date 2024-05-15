import 'package:easy_pro/src/features/criminal_record_form/components/item_resum.dart';
import 'package:easy_pro/src/features/criminal_record_form/criminal_record_screen.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/shared/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';

class StepTree extends StatelessWidget {
  const StepTree({
    super.key,
    required this.onBackStep,
    required this.onNextStep,
    required this.civilite,
    required this.fullName,
    required this.usager,
    required this.location,
    required this.email,
    required this.region,
    required this.number,
    required this.price,
    required this.accepted,
    this.character,
    this.onChangedInformation,
    required this.numberChoice,
    required this.whatsappNumber,
    required this.onAccepChanged,
    required this.contactPersonName,
    required this.residenceCondition,
    required this.placeOfResidence,
    required this.address,
    this.singingCharacter,
    required this.postalCodeName,
    required this.jobName,
    required this.maritalStatusName,
    required this.deliveryAddressName,
    required this.placeCalledText,
  });
  final Function() onBackStep;
  final Function() onNextStep;
  final String email;
  final String civilite;
  final String jobName;

  final String fullName;
  final String maritalStatusName;
  final String usager;
  final String location;
  final String number;
  final String numberChoice;
  final String whatsappNumber;
  final String contactPersonName;
  final String address;
  final String postalCodeName;
  final String deliveryAddressName;
  final String placeCalledText;

  final String? region;

  final bool accepted;
  final Map<String, dynamic> price;
  final TermCondition? character;
  final Function(TermCondition?)? onChangedInformation;
  final void Function(bool?)? onAccepChanged;
  final ResidenceCondition? residenceCondition;
  final String placeOfResidence;
  final SingingCharacter? singingCharacter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemResum(label: 'Civilité', value: civilite),
        ItemResum(label: 'Nom et Prénom', value: fullName),
        ItemResum(label: 'Téléphone', value: number),
        ItemResum(label: 'Numéro Whatsapp', value: whatsappNumber),
        ItemResum(label: 'Email', value: email),
        ItemResum(label: 'Ma profession', value: jobName),
        ItemResum(label: 'Mon Statut matrimonal', value: maritalStatusName),
        ItemResum(label: 'Type d\'usager', value: usager),
        if (usager == 'Je suis Camerounais né au Cameroun')
          Column(
            children: [
              ItemResum(
                  label: 'Ma Région et mon\ndépartement de naissance',
                  value: region!),
              ItemResum(
                  label: 'Tribunal d\'etablissement C.J:', value: location),
            ],
          )
        else
          const ItemResum(
              label: 'Mon casier judiciaire\nsera etabli au: ',
              value:
                  "Fichier central des casiers judiciaires - Minjustice - Yaoundé"),
        ItemResum(
          label: 'Je réside à: ',
          value: residenceCondition == ResidenceCondition.cameroon
              ? "Je réside au cameroun"
              : "Je réside a l'étranger",
        ),
        ItemResum(
            label: residenceCondition == ResidenceCondition.cameroon
                ? 'Ma commune de\nrésidence est:'
                : "Mon pays de\nré```sidence est:",
            value: placeOfResidence),
        residenceCondition == ResidenceCondition.cameroon
            ? Column(
                children: [
                  ItemResum(
                      label: 'L\'adresse de livraison est',
                      value: deliveryAddressName),
                  ItemResum(label: 'Lieu dit', value: placeCalledText),
                ],
              )
            : const SizedBox(),
        residenceCondition == ResidenceCondition.stranger
            ? Column(
                children: [
                  ItemResum(label: 'Adresse', value: address),
                  ItemResum(label: 'Code postal', value: postalCodeName),
                ],
              )
            : const SizedBox(),
        ItemResum(
            label: 'Numéro de la personne à contacter',
            value: contactPersonName),
        ItemResum(label: 'Nombre de casiers judiciaire', value: numberChoice),
        const Divider(),
        Row(
          children: [
            Checkbox(
              checkColor: Theme.of(context).colorScheme.background,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: accepted,
              onChanged: onAccepChanged,
            ),
            Flexible(
              child: Text(
                "Je confirme que mes informations sont correctes",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            )
          ],
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
                type: ButtonType.primary,
                onPressed: accepted == true ? onNextStep : null,
                text: "Télécharger vos documents"),
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            Button(
                type: ButtonType.secondary,
                onPressed: onBackStep,
                text: "Retour"),
          ],
        ),
        SizedBox(
          height: Dimens.space.h,
        ),
      ],
    );
  }
}
