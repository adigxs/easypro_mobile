import 'dart:io';

import 'package:easy_pro/src/features/criminal_record_form/criminal_record_screen.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:flutter/material.dart';
import 'package:easy_pro/src/shared/components/dropdown_button_form.dart';
import 'package:easy_pro/src/shared/components/input.dart';
import 'package:easy_pro/src/shared/utils/common.dart';
import 'package:easy_pro/src/datasource/models/dropdown_model.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/label.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({
    super.key,
    required this.onChangeBorn,
    this.onChangedSubcribe,
    required this.onNextStep,
    this.selectedBornValue,
    required this.onChangeCivility,
    this.selectedCivilityValue,
    this.onChangedFullName,
    this.fullNameController,
    this.addressController,
    this.selectedCoursValue,
    required this.onChangeCours,
    this.character,
    required this.coursCommuneList,
    required this.onChangeRegion,
    required this.onChangeCoursCommune,
    required this.onChangeCustom,
    required this.customCours,
    this.emailController,
    this.numberController,
    required this.allList,
    this.selectedNumberValue,
    required this.onChangeNumber,
    this.whatsappNumberController,
    this.validatorCivility,
    this.validatorRegion,
    this.validatorCourt,
    this.validatorLocation,
    this.validatorBirth,
    this.regionSelected,
    required this.number,
    this.onInputChanged,
    this.contactPersonController,
    this.onChangedResidenceSubcribe,
    this.residenceCondition,
    this.validatorNationality,
    this.selectedNationalityValue,
    this.onInputContactChanged,
    this.onInputWhatsappContactChanged,
    this.postalCodeController,
    this.selectedMaritalStatusValue,
    required this.onChangeMaritalStatus,
    this.jobController,
    this.validatorMaritalStatus,
    this.deliveryAddressController,
    this.placeCalledController,
  });

  final Function(DropdownModel) onChangeCivility;
  final DropdownModel? selectedCivilityValue;
  final DropdownModel? selectedMaritalStatusValue;
  final Function(DropdownModel) onChangeMaritalStatus;
  final Function(String)? onChangedFullName;
  final TextEditingController? fullNameController;
  final TextEditingController? deliveryAddressController;
  final TextEditingController? placeCalledController;
  final TextEditingController? emailController;
  final TextEditingController? postalCodeController;
  final TextEditingController? addressController;
  final TextEditingController? jobController;
  final TextEditingController? contactPersonController;

  final Function(DropdownModel) onChangeBorn;
  final DropdownModel? selectedBornValue;
  final DropdownModel? selectedNationalityValue;

  final DropdownModel? selectedCoursValue;
  final Function(DropdownModel) onChangeCours;

  final DropdownModel? selectedNumberValue;
  final Function(DropdownModel) onChangeNumber;

  final Function(SingingCharacter?)? onChangedSubcribe;

  final Function(ResidenceCondition?)? onChangedResidenceSubcribe;

  final TextEditingController? numberController;

  final TextEditingController? whatsappNumberController;

  final Function() onNextStep;

  final SingingCharacter? character;
  final ResidenceCondition? residenceCondition;

  final Function(DropdownModel) onChangeCoursCommune;
  final Function(DropdownModel) onChangeRegion;
  final Function(DropdownModel) onChangeCustom;

  final List<DropdownModel> coursCommuneList;

  final List<DropdownModel> customCours;
  final List<DropdownModel> allList;

  final String? Function(DropdownModel?)? validatorCivility;
  final String? Function(DropdownModel?)? validatorMaritalStatus;
  final String? Function(DropdownModel?)? validatorRegion;
  final String? Function(DropdownModel?)? validatorCourt;
  final String? Function(DropdownModel?)? validatorLocation;
  final String? Function(DropdownModel?)? validatorBirth;
  final String? Function(DropdownModel?)? validatorNationality;

  final Function(PhoneNumber)? onInputChanged;
  final Function(PhoneNumber)? onInputContactChanged;
  final Function(PhoneNumber)? onInputWhatsappContactChanged;

  final DropdownModel? regionSelected;
  final PhoneNumber number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "1- Civilités", required: true),
        DropdownButtonForm<DropdownModel>(
          items: civilites,
          selectedValue: selectedCivilityValue,
          label: 'Sélectionner',
          onChangeValue: (value) {},
          onChanged: onChangeCivility,
          validator: validatorCivility,
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "2- Nom et Prénoms", required: true),
        Input(
          hintText: 'Votre réponse',
          controller: fullNameController,
          validator: ValidationBuilder().required().build(),
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "3- Numéro de téléphone", required: true),
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimens.radius.w)),
              color: Colors.white.withOpacity(0.5),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              )),
          child: InternationalPhoneNumberInput(
            onInputChanged: onInputChanged,
            onInputValidated: (bool value) {},
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: numberController,
            validator: ValidationBuilder().phone().build(),
            formatInput: true,
            textStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
            inputDecoration: InputDecoration.collapsed(
                hintText: 'Votre réponse',
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5))),
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            onSaved: (PhoneNumber number) {},
          ),
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "4- Contact Whatsapp", required: true),
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimens.radius.w)),
              color: Colors.white.withOpacity(0.5),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              )),
          child: InternationalPhoneNumberInput(
            onInputChanged: onInputWhatsappContactChanged,
            onInputValidated: (bool value) {},
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: whatsappNumberController,
            validator: ValidationBuilder().phone().build(),
            formatInput: true,
            textStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
            inputDecoration: InputDecoration.collapsed(
                hintText: 'Votre réponse',
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5))),
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            onSaved: (PhoneNumber number) {},
          ),
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "5- Email"),
        Input(
          hintText: 'Votre réponse',
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          // onChanged: onChangedFullName,
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "6- Ma profession est:", required: true),
        Input(
          hintText: 'Votre réponse',
          controller: jobController,
          validator: ValidationBuilder().required().build(),
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "7- Mon Statut matrimonial est: ", required: true),
        DropdownButtonForm<DropdownModel>(
          items: maritalStatus,
          selectedValue: selectedMaritalStatusValue,
          label: 'Sélectionner',
          onChangeValue: (value) {},
          onChanged: onChangeMaritalStatus,
          validator: validatorMaritalStatus,
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(title: "8- Type d'usager", required: true),
        Column(children: [
          RadioListTile<SingingCharacter>(
            title: Text(
              usagerType[0]["title"],
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            fillColor: MaterialStateProperty.resolveWith(
                (_) => Theme.of(context).primaryColor),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            value: SingingCharacter.cameroonian,
            groupValue: character,
            dense: true,
            onChanged: onChangedSubcribe,
          ),
          RadioListTile<SingingCharacter>(
            title: Text(
              usagerType[1]["title"],
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            fillColor: MaterialStateProperty.resolveWith(
                (_) => Theme.of(context).primaryColor),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            value: SingingCharacter.cameroforeigner,
            groupValue: character,
            dense: true,
            onChanged: onChangedSubcribe,
          ),
          RadioListTile<SingingCharacter>(
            title: Text(
              usagerType[2]["title"],
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            fillColor: MaterialStateProperty.resolveWith(
                (_) => Theme.of(context).primaryColor),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            value: SingingCharacter.foreigner,
            groupValue: character,
            dense: true,
            onChanged: onChangedSubcribe,
          ),
        ]),
        character == SingingCharacter.cameroonian
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimens.doubleSpace.h,
                  ),
                  const Label(
                    title:
                        "8.1- Ma Région et mon département de naissance sont: ",
                    required: true,
                  ),
                  DropdownButtonForm<DropdownModel>(
                    items: allList,
                    label: 'Sélectionner',
                    onChangeValue: (value) {},
                    onChanged: onChangeRegion,
                    validator: validatorRegion,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimens.doubleSpace.h,
                      ),
                      const Label(
                        title: "8.2- Mon casier judiciaire sera établi à: ",
                        required: true,
                      ),
                      DropdownButtonForm<DropdownModel>(
                        items: customCours,
                        label: 'Sélectionner',
                        onChangeValue: (value) {},
                        validator: validatorCourt,
                        onChanged: onChangeCustom,
                      )
                    ],
                  ),
                ],
              )
            : const SizedBox(),
        character == SingingCharacter.cameroforeigner ||
                character == SingingCharacter.foreigner
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimens.doubleSpace.h,
                  ),
                  const Label(
                    title: "8.3- Mon casier judiciare sera établi à:",
                    required: true,
                  ),
                  DropdownButtonForm<DropdownModel>(
                    items: customCours,
                    label: 'Sélectionner',
                    onChangeValue: (value) {},
                    onChanged: onChangeCustom,
                    validator: validatorLocation,
                  ),
                ],
              )
            : const SizedBox(),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(
          title: "9- Je reside à:",
          required: true,
        ),
        RadioListTile<ResidenceCondition>(
          title: Text(
            "Je réside au cameroun",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          fillColor: MaterialStateProperty.resolveWith(
              (_) => Theme.of(context).primaryColor),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          value: ResidenceCondition.cameroon,
          groupValue: residenceCondition,
          dense: true,
          onChanged: onChangedResidenceSubcribe,
        ),
        RadioListTile<ResidenceCondition>(
          title: Text(
            "Je réside a l'étranger",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onBackground),
          ),
          fillColor: MaterialStateProperty.resolveWith(
              (_) => Theme.of(context).primaryColor),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          value: ResidenceCondition.stranger,
          groupValue: residenceCondition,
          dense: true,
          onChanged: onChangedResidenceSubcribe,
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        residenceCondition == ResidenceCondition.cameroon
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Label(
                    title: "9.1- Ma commune de résidence est:",
                    required: true,
                  ),
                  DropdownButtonForm<DropdownModel>(
                    items: birth,
                    label: 'Sélectionner',
                    selectedValue: selectedBornValue,
                    onChangeValue: (value) {},
                    validator: validatorBirth,
                    onChanged: onChangeBorn,
                  ),
                  SizedBox(
                    height: Dimens.doubleSpace.h,
                  ),
                  const Label(
                    title: "9.2- L'adresse de livraison est:",
                    required: true,
                  ),
                  Input(
                    hintText: 'Votre réponse',
                    controller: deliveryAddressController,
                    validator: ValidationBuilder().required().build(),
                  ),
                  SizedBox(
                    height: Dimens.doubleSpace.h,
                  ),
                  const Label(
                    title: "9.3- Lieu dit:",
                    required: true,
                  ),
                  Input(
                    hintText: 'Votre réponse',
                    controller: placeCalledController,
                    validator: ValidationBuilder().required().build(),
                  ),
                ],
              )
            : const SizedBox(),
        residenceCondition == ResidenceCondition.stranger
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Label(
                    title: "9.4- Mon pays de résidence est:",
                    required: true,
                  ),
                  DropdownButtonForm<DropdownModel>(
                    items: nationality,
                    label: 'Sélectionner',
                    selectedValue: selectedNationalityValue,
                    onChangeValue: (value) {},
                    validator: validatorNationality,
                    onChanged: onChangeBorn,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimens.doubleSpace.h,
                      ),
                      const Label(
                        title: "9.5- Adresse",
                        required: true,
                      ),
                      Input(
                        hintText: 'Votre réponse',
                        controller: addressController,
                        validator: ValidationBuilder().required().build(),
                        // onChanged: onChangedOtherBorn,
                      ),
                      SizedBox(
                        height: Dimens.doubleSpace.h,
                      ),
                      const Label(
                        title: "9.6- Code Postal",
                        required: true,
                      ),
                      Input(
                        hintText: 'Votre réponse',
                        controller: postalCodeController,
                        validator: ValidationBuilder().required().build(),
                        // onChanged: onChangedOtherBorn,
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox(),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(
            title: "10- Numéro d'un proche (CAS D'URGENCE)", required: true),
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Dimens.radius.w)),
              color: Colors.white.withOpacity(0.5),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              )),
          child: InternationalPhoneNumberInput(
            onInputChanged: onInputContactChanged,
            onInputValidated: (bool value) {},
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: contactPersonController,
            validator: ValidationBuilder().phone().build(),
            formatInput: true,
            textStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
            inputDecoration: InputDecoration.collapsed(
                hintText: 'Votre réponse',
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5))),
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            onSaved: (PhoneNumber number) {},
          ),
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        const Label(
          title: "11- Nombre de casiers judiciaire dont j'ai besoin:",
        ),
        DropdownButtonForm<DropdownModel>(
          items: numberChoice,
          selectedValue: selectedNumberValue,
          label: 'Sélectionner',
          onChangeValue: (value) {},
          onChanged: onChangeNumber,
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Button(
                  type: ButtonType.secondary,
                  onPressed: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  },
                  text: "Annuler"),
            ),
            SizedBox(
              width: Dimens.minSpace.w,
            ),
            Flexible(
              child: Button(
                  type: ButtonType.primary,
                  onPressed: onNextStep,
                  text: "Continuer"),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.space.h,
        ),
      ],
    );
  }
}
