import 'package:easy_pro/src/features/criminal_record_form/components/item_resum.dart';
import 'package:easy_pro/src/features/criminal_record_form/criminal_record_screen.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/shared/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final appLocalizations = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemResum(label: appLocalizations!.title, value: civilite),
        ItemResum(label: appLocalizations.full_name, value: fullName),
        ItemResum(label: appLocalizations.phone_number, value: number),
        ItemResum(
            label: appLocalizations.whastapp_number, value: whatsappNumber),
        ItemResum(label: appLocalizations.email, value: email),
        ItemResum(label: appLocalizations.job, value: jobName),
        ItemResum(label: appLocalizations.marital, value: maritalStatusName),
        ItemResum(label: appLocalizations.user_type, value: usager),
        if (usager == 'Je suis Camerounais né au Cameroun')
          Column(
            children: [
              ItemResum(
                  label: appLocalizations.my_birth_region, value: region!),
              ItemResum(label: appLocalizations.user_type, value: location),
            ],
          )
        else
          ItemResum(
              label: appLocalizations.criminal_record_certificate,
              value: appLocalizations.central_file),
        ItemResum(
          label: appLocalizations.place_of_residence,
          value: residenceCondition == ResidenceCondition.cameroon
              ? appLocalizations.i_live_cameroon
              : appLocalizations.i_live_abroad,
        ),
        ItemResum(
            label: residenceCondition == ResidenceCondition.cameroon
                ? appLocalizations.municipality
                : appLocalizations.location_country,
            value: placeOfResidence),
        residenceCondition == ResidenceCondition.cameroon
            ? Column(
                children: [
                  ItemResum(
                      label: appLocalizations.address,
                      value: deliveryAddressName),
                  ItemResum(
                      label: appLocalizations.location, value: placeCalledText),
                ],
              )
            : const SizedBox(),
        residenceCondition == ResidenceCondition.stranger
            ? Column(
                children: [
                  ItemResum(
                      label: appLocalizations.adresse_country, value: address),
                  ItemResum(
                      label: appLocalizations.postal_code,
                      value: postalCodeName),
                ],
              )
            : const SizedBox(),
        ItemResum(
            label: appLocalizations.alternate_number, value: contactPersonName),
        ItemResum(
            label: appLocalizations.number_of_criminal, value: numberChoice),
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
                appLocalizations.certify_info,
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
                text: appLocalizations.upload_doc),
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            Button(
                type: ButtonType.secondary,
                onPressed: onBackStep,
                text: appLocalizations.back),
          ],
        ),
        SizedBox(
          height: Dimens.space.h,
        ),
      ],
    );
  }
}
