import 'dart:convert';
import 'dart:io';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_pro/src/datasource/models/api_response.dart';
import 'package:easy_pro/src/datasource/models/check_transaction_request.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/check_transaction/check_transaction_bloc.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/check_transaction/check_transaction_event.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/check_transaction/check_transaction_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_pro/generated/assets.gen.dart';
import 'package:easy_pro/src/datasource/models/file_upload.dart';
import 'package:easy_pro/src/datasource/models/payment_request.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/payment_bloc.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/payment_event.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/payment_state.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/shared/components/input.dart';
import 'package:easy_pro/src/shared/components/loader.dart';
import 'package:easy_pro/src/shared/services/upload_file.dart';
import 'package:easy_pro/src/datasource/models/criminal_record_request.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/step_five.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/criminal_bloc.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/criminal_event.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/criminal_state.dart';
import 'package:easy_pro/src/shared/components/invoice.dart';
import 'package:easy_pro/src/shared/components/loading_dialog.dart';
import 'package:easy_pro/src/shared/components/message_dialog.dart';
import 'package:easy_pro/src/shared/utils/mocks.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/datasource/models/dropdown_model.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/step_one.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/step_tree.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/step_two.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/steper_count.dart';
import 'package:easy_pro/src/shared/utils/common.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/language_bloc.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/language_event.dart';
import 'package:easy_pro/src/datasource/models/language.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/laguage_state.dart';

class CriminalRecordScreen extends StatefulWidget {
  const CriminalRecordScreen({super.key});

  @override
  State<CriminalRecordScreen> createState() => _CriminalRecordScreenState();
}

enum SingingCharacter { cameroonian, cameroforeigner, foreigner }

enum TermCondition { confirmation, accepted }

enum ResidenceCondition { cameroon, stranger }

class _CriminalRecordScreenState extends State<CriminalRecordScreen> {
  final storage = const FlutterSecureStorage();
  final String key = 'document';
  int step = 1;
  int index = 1;
  int paymentMode = 3;
  final int stepsLength = 5;

  bool onAccepted = false;
  bool accepted = false;
  bool acceptedNote = false;
  bool isDisplayInvoice = false;

  DropdownModel civilitySelected = civilites.first;
  DropdownModel maritalStatusSelected = maritalStatus.first;

  DropdownModel bornSelected = birth.first;
  DropdownModel nationalitySelected = nationality.first;
  DropdownModel coursSelected = cours.first;
  DropdownModel? regionSelected;
  DropdownModel selectedChoiceNumber = numberChoice.first;

  String fullName = '';
  TextEditingController? fullNameTextController;
  TextEditingController? emailTextController;
  // TextEditingController? bornTextController;
  TextEditingController? contactPersonTextController;
  TextEditingController? numberTextController;
  TextEditingController? whatsappTextController;
  TextEditingController? addressTextController;
  TextEditingController? postalCodeTextController;
  TextEditingController? jobTextController;
  TextEditingController? deliveryAddressTextController;
  TextEditingController? placeCalledTextController;

  String bornValue = '';
  String otherBornValue = '';
  String typeUsager = '';
  String location = '';
  String requestCode = '';

  List multipleSelected = [];
  List multipleExtractSelected = [];
  List multipleExtractSopac = [];
  List multipleExtractBuyConfirmation = [];

  PlatformFile? fileCniFront;
  PlatformFile? fileCniBack;
  PlatformFile? fileWedCertificate;

  PlatformFile? filePassportIdentity;
  PlatformFile? filePassportVisa;
  PlatformFile? fileResidencePermit;
  PlatformFile? filePaymentMethod;

  PlatformFile? fileActe;

  SingingCharacter? character;
  TermCondition? termCondition;
  ResidenceCondition? residenceCondition;

  List<DropdownModel> coursCommune = [];
  List<DropdownModel> customCours = [];
  List<DropdownModel> allList = [];

  Map<String, dynamic> price = {};

  PhoneNumber number = PhoneNumber(isoCode: 'CM');

  bool isLoadingBirthCertificate = false;
  bool isLoadingPassport = false;
  bool isLoadingPassportVisaPage = false;
  bool isLoadingProofofStayInCameroonFiles = false;
  bool isLoadingCniBackFiles = false;
  bool isLoadingCniFrontFiles = false;
  bool isLoadingWeddingFiles = false;
  bool isLoadingOtherPaymentFiles = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _secondFormKey = GlobalKey<FormState>();

  String fileCniFrontName = '';
  String fileCniBackName = '';
  String fileWedCertificateName = '';
  String filePassportIdentityName = '';
  String filePassportVisaName = '';
  String fileResidencePermitName = '';
  String fileActeName = '';
  String otherPaymentName = '';

  @override
  void initState() {
    super.initState();
    deleteCacheDir();
    deleteAppDir();
    // read();
    emailTextController = TextEditingController();
    fullNameTextController = TextEditingController();
    numberTextController = TextEditingController();
    whatsappTextController = TextEditingController();
    contactPersonTextController = TextEditingController();
    addressTextController = TextEditingController();
    postalCodeTextController = TextEditingController();
    addressTextController = TextEditingController();
    jobTextController = TextEditingController();
    deliveryAddressTextController = TextEditingController();
    placeCalledTextController = TextEditingController();
  }

  Future deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  Future deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  Future<void> read() async {
    final data = await storage.read(key: key);
    setState(() {
      if (data != null) {
        final document = jsonDecode(data) as Map<String, dynamic>;
        emailTextController =
            TextEditingController(text: document['email'] ?? '');
        fullNameTextController =
            TextEditingController(text: document['fullName'] ?? '');
        contactPersonTextController =
            TextEditingController(text: document['contactPerson'] ?? '');
        civilitySelected = civilites
            .firstWhere((element) => element.name == document['civilitie']);
        bornSelected =
            birth.firstWhere((element) => element.name == document['born']);
        coursSelected =
            cours.firstWhere((element) => element.name == document['court']);

        regionSelected =
            regions.firstWhere((element) => element.name == document['region']);
        location = document['court'] ?? '';

        location = document['location'] ?? '';

        numberTextController =
            TextEditingController(text: document['number'] ?? '');

        whatsappTextController =
            TextEditingController(text: document['whatsapp'] ?? '');

        addressTextController =
            TextEditingController(text: document['address'] ?? '');
      } else {
        emailTextController = TextEditingController();
        fullNameTextController = TextEditingController();
        numberTextController = TextEditingController();
        whatsappTextController = TextEditingController();
        contactPersonTextController = TextEditingController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    String title = step == 1
        ? ""
        : step == 2
            ? appLocalizations!.title_2
            : step == 3
                ? appLocalizations!.title_3
                : step == 4
                    ? appLocalizations!.title_4
                    : appLocalizations!.title_5;
    return Scaffold(
      backgroundColor: step == 4
          ? Theme.of(context).colorScheme.background
          : Colors.green[100],
      appBar: AppBar(
        // backgroundColor: Colors.red,
        toolbarHeight: 70,
        leading: Row(
          children: [
            RawMaterialButton(
              onPressed: () {
                showLanguageBottomSheet(context);
              },
              constraints: const BoxConstraints(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.fullRadius.w),
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor)),
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimens.smPadding.h,
                        horizontal: Dimens.halfPadding.w),
                    child: Text(
                      context
                          .read<LanguageBloc>()
                          .state
                          .selectedLanguage
                          .value
                          .languageCode
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Dimens.padding.w),
            child: Row(
              children: [
                SizedBox(
                  width: Dimens.space.w,
                ),
                for (index = 1; index <= stepsLength; index++)
                  Row(
                    children: [
                      SteperCount(
                        number: index,
                        isActive: step >= index ? true : false,
                      ),
                      if (index != 5)
                        SvgPicture.asset(
                          Assets.icons.arrowRight,
                          colorFilter: ColorFilter.mode(
                              step >= index
                                  ? Theme.of(context).colorScheme.outline
                                  : Theme.of(context).colorScheme.surface,
                              BlendMode.srcIn),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: step == 4
                          ? Colors.red
                          : Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: BlocListener<CriminalBloc, CriminalState>(
        listener: (context, state) {
          if (state is LoadingCriminalState) {
            LoadingDialog.show(context: context);
          } else if (state is SuccessCreateCriminalRecordState) {
            LoadingDialog.hide(context: context);
            nextStep();
          }
          if (state is SuccessDownloadPdfState) {
            LoadingDialog.hide(context: context);
            Navigator.of(context, rootNavigator: true).pop();
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          } else if (state is ErrorCriminalState) {
            LoadingDialog.hide(context: context);
            MessageDialog.show(
                context: context,
                type: MessageType.Error,
                message: state.errorMessage);
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding.w),
            child: SizedBox.expand(
              child: step == 1
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: StepOne(
                        tremsAccepted: onAccepted,
                        onAccepTermeChanged: (value) {
                          setState(() {
                            onAccepted = value!;
                          });
                        },
                        onNextStep: () {
                          setState(() {
                            step++;
                          });
                        },
                      ))
                  : step == 2
                      ? SingleChildScrollView(
                          child: StepTwo(
                            onInputChanged: (number) {
                              numberTextController = TextEditingController(
                                  text: number.phoneNumber);
                            },
                            onInputContactChanged: (number) {
                              contactPersonTextController =
                                  TextEditingController(
                                      text: number.phoneNumber);
                            },
                            onInputWhatsappContactChanged: (number) {
                              whatsappTextController = TextEditingController(
                                  text: number.phoneNumber);
                            },
                            onChangeCivility: (value) {
                              setState(() {
                                civilitySelected = value;
                              });
                            },
                            onChangeMaritalStatus: (value) {
                              setState(() {
                                maritalStatusSelected = value;
                              });
                            },
                            selectedMaritalStatusValue: maritalStatusSelected,
                            number: number,
                            customCours: customCours,
                            selectedCivilityValue: civilitySelected,
                            fullNameController: fullNameTextController,
                            contactPersonController:
                                contactPersonTextController,
                            onChangedFullName: (value) {
                              setState(() {
                                fullName = value;
                              });
                            },
                            allList: allList,
                            jobController: jobTextController,
                            emailController: emailTextController,
                            numberController: numberTextController,
                            whatsappNumberController: whatsappTextController,
                            selectedBornValue: bornSelected,
                            selectedNationalityValue: nationalitySelected,
                            addressController: addressTextController,
                            postalCodeController: postalCodeTextController,
                            deliveryAddressController:
                                deliveryAddressTextController,
                            placeCalledController: placeCalledTextController,
                            onChangeCustom: (value) {
                              setState(() {
                                location = value.name;
                              });
                            },
                            onChangeBorn: (value) {
                              setState(() {
                                if (residenceCondition ==
                                    ResidenceCondition.cameroon) {
                                  bornSelected = value;
                                } else {
                                  nationalitySelected = value;
                                }
                              });
                            },
                            residenceCondition: residenceCondition,
                            onChangedResidenceSubcribe: (value) {
                              setState(() {
                                residenceCondition = value;
                              });
                            },
                            character: character,
                            coursCommuneList: coursCommune,
                            selectedNumberValue: selectedChoiceNumber,
                            onChangeNumber: (value) {
                              setState(() {
                                selectedChoiceNumber = value;
                              });
                            },
                            regionSelected: regionSelected,
                            onChangeCoursCommune: (p0) {},
                            onChangeRegion: (value) {
                              setState(() {
                                regionSelected = value;
                                allCours.firstWhere((element) {
                                  if (element['name'] == value.name) {
                                    if (regionSelected!.name
                                            .contains('NORD-OUEST') ||
                                        regionSelected!.name
                                            .contains('SUD-OUEST')) {
                                      customCours = [...element['value']]
                                          .map((value) => DropdownModel(
                                              value: value, name: value))
                                          .toList();
                                      customCours = [
                                        ...[
                                          'Fichier central des casiers judiciaires - Minjustice - Yaoundé'
                                        ].map((value) => DropdownModel(
                                            value: value, name: value)),
                                        ...customCours
                                      ];
                                    } else {
                                      customCours = [...element['value']]
                                          .map((value) => DropdownModel(
                                              value: value, name: value))
                                          .toList();
                                    }
                                    return true;
                                  }
                                  customCours = [];

                                  return false;
                                });
                              });
                            },
                            onChangedSubcribe: (value) {
                              setState(() {
                                character = value;
                                if (value == SingingCharacter.cameroonian) {
                                  allList = regions;
                                  typeUsager =
                                      "Je suis Camerounais né au Cameroun";
                                } else if (value ==
                                    SingingCharacter.cameroforeigner) {
                                  allList = customCoursList;
                                  customCours = [
                                    'Fichier central des casiers judiciaires - Minjustice - Yaoundé'
                                  ]
                                      .map((value) => DropdownModel(
                                          value: value, name: value))
                                      .toList();
                                  typeUsager =
                                      "Je suis Camerounais né a l'étranger";
                                } else {
                                  allList = customCoursList;
                                  customCours = [
                                    'Fichier central des casiers judiciaires - Minjustice - Yaoundé'
                                  ]
                                      .map((value) => DropdownModel(
                                          value: value, name: value))
                                      .toList();
                                  typeUsager =
                                      "Je suis de nationalité étrangère";
                                }
                              });
                            },
                            selectedCoursValue: coursSelected,
                            onChangeCours: (value) {
                              setState(() {
                                coursSelected = value;
                              });
                            },
                            validatorCivility: (value) {
                              return validatorDropdwon(
                                  value: value,
                                  message: 'Please select civility value.');
                            },
                            validatorMaritalStatus: (value) {
                              return validatorDropdwon(
                                  value: value,
                                  message: 'Please select marital status.');
                            },
                            validatorRegion: (value) {
                              return validatorDropdwon(
                                  value: value,
                                  message: 'Please select region value.');
                            },
                            validatorCourt: (value) {
                              return validatorDropdwon(
                                  value: value,
                                  message: 'Please select court value.');
                            },
                            validatorLocation: (value) {
                              return validatorDropdwon(
                                  value: value,
                                  message: 'Please select location value.');
                            },
                            validatorBirth: (value) {
                              return validatorDropdwon(
                                  value: value,
                                  message:
                                      'Please select place of residence value.');
                            },
                            validatorNationality: (value) {
                              return validatorDropdwon(
                                  value: value,
                                  message: 'Please select country value.');
                            },
                            onNextStep: () {
                              if (formKey.currentState?.validate() == true) {
                                setState(() {
                                  if (typeUsager.isEmpty) {
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Warning! Vous devez choisir le type d\'usager!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    step++;
                                  }
                                });
                              }
                            },
                          ),
                        )
                      : step == 3
                          ? SingleChildScrollView(
                              child: StepTree(
                                character: termCondition,
                                region: regionSelected?.name,
                                fullName: fullNameTextController?.text ?? "",
                                email: emailTextController?.text ?? "",
                                number: numberTextController?.text ?? "",
                                whatsappNumber: whatsappTextController!.text,
                                postalCodeName: postalCodeTextController!.text,
                                jobName: jobTextController?.text ?? '',
                                deliveryAddressName:
                                    deliveryAddressTextController?.text ?? "",
                                placeCalledText:
                                    placeCalledTextController?.text ?? "",
                                contactPersonName:
                                    contactPersonTextController!.text,
                                numberChoice: selectedChoiceNumber.value,
                                accepted: accepted,
                                civilite: civilitySelected.name,
                                maritalStatusName: maritalStatusSelected.name,
                                singingCharacter: character,
                                placeOfResidence: residenceCondition ==
                                        ResidenceCondition.cameroon
                                    ? bornSelected.name
                                    : nationalitySelected.name,
                                address: addressTextController?.text ?? "",
                                residenceCondition: residenceCondition,
                                usager: typeUsager,
                                location: location,
                                price: price,
                                onAccepChanged: (value) {
                                  setState(() {
                                    accepted = value!;
                                  });
                                },
                                onChangedInformation: (value) {},
                                onBackStep: () {
                                  setState(() {
                                    step--;
                                  });
                                },
                                onNextStep: () async {
                                  onCreateCriminalRecord();
                                },
                              ),
                            )
                          : step == 4
                              ? SingleChildScrollView(
                                  child:
                                      BlocListener<CriminalBloc, CriminalState>(
                                  listener: (context, state) {
                                    if (state is LoadingCriminalState) {
                                      LoadingDialog.show(context: context);
                                    } else if (state
                                        is SuccessUploadFileRecordState) {
                                      LoadingDialog.hide(context: context);
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      nextStep();
                                    } else if (state is ErrorCriminalState) {
                                      LoadingDialog.hide(context: context);
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      MessageDialog.show(
                                          context: context,
                                          type: MessageType.Error,
                                          message: state.errorMessage);
                                    } else {
                                      LoadingDialog.hide(context: context);
                                    }
                                  },
                                  child: StepFive(
                                    fileCniFrontName: fileCniFront?.name,
                                    fileCniBackName: fileCniBack?.name,
                                    fileWedCertificateName:
                                        fileWedCertificate?.name,
                                    filePassportIdentityName:
                                        filePassportIdentity?.name,
                                    filePassportVisaName:
                                        filePassportVisa?.name,
                                    fileResidencePermitName:
                                        fileResidencePermit?.name,
                                    isLoadingBirthCertificate:
                                        isLoadingBirthCertificate,
                                    isLoadingPassport: isLoadingPassport,
                                    isLoadingPassportVisaPage:
                                        isLoadingPassportVisaPage,
                                    isLoadingProofofStayInCameroonFiles:
                                        isLoadingProofofStayInCameroonFiles,
                                    isLoadingCniBackFiles:
                                        isLoadingCniBackFiles,
                                    isLoadingCniFrontFiles:
                                        isLoadingCniFrontFiles,
                                    isLoadingWeddingFiles:
                                        isLoadingWeddingFiles,
                                    character: character,
                                    onNextStep: () {
                                      if (character ==
                                              SingingCharacter.cameroonian ||
                                          character ==
                                              SingingCharacter
                                                  .cameroforeigner) {
                                        if (fileActeName != '' &&
                                            fileCniFrontName != '') {
                                          FileUpload fileUpload = FileUpload(
                                              fileCniFrontName:
                                                  fileCniFrontName,
                                              fileCniBackName: fileCniBackName,
                                              fileWedCertificateName:
                                                  fileWedCertificateName,
                                              filePassportIdentityName:
                                                  filePassportIdentityName,
                                              filePassportVisaName:
                                                  filePassportVisaName,
                                              fileResidencePermitName:
                                                  fileResidencePermitName,
                                              fileActeName: fileActeName);

                                          context.read<CriminalBloc>().add(
                                              OnUploadFile(
                                                  fileUpload: fileUpload));
                                        } else {
                                          MessageDialog.show(
                                              context: context,
                                              type: MessageType.Error,
                                              message:
                                                  "Vous devez joindre la copie de l'acte et de la CNI");
                                        }
                                      } else if (character ==
                                          SingingCharacter.foreigner) {
                                        FileUpload fileUpload = FileUpload(
                                            fileCniFrontName: "",
                                            fileCniBackName: "",
                                            fileWedCertificateName:
                                                fileWedCertificateName,
                                            filePassportIdentityName:
                                                filePassportIdentityName,
                                            filePassportVisaName:
                                                filePassportVisaName,
                                            fileResidencePermitName:
                                                fileResidencePermitName,
                                            fileActeName: "");

                                        context.read<CriminalBloc>().add(
                                            OnUploadFile(
                                                fileUpload: fileUpload));
                                      }
                                    },
                                    onTapWedCertificateFile: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'pdf',
                                          'doc',
                                          'docx',
                                          'jpg',
                                          'png'
                                        ],
                                      );

                                      if (result != null) {
                                        setState(() {
                                          isLoadingWeddingFiles = true;
                                          fileWedCertificate =
                                              result.files.first;
                                        });

                                        PlatformFile file = result.files.first;

                                        final data = await uploadFile(file);

                                        if (data.successResponse != null) {
                                          fileWedCertificateName =
                                              data.successResponse!;
                                          setState(() {
                                            isLoadingWeddingFiles = false;
                                          });
                                        } else {
                                          ApiError<dynamic> error =
                                              data.errorResponse!;
                                          errorMessage(message: error.message);
                                          setState(() {
                                            isLoadingWeddingFiles = false;
                                          });
                                        }
                                      }
                                    },
                                    onTapCniFrontFile: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'pdf',
                                          'doc',
                                          'docx',
                                          'jpg',
                                          'png'
                                        ],
                                      );
                                      if (result != null) {
                                        setState(() {
                                          isLoadingCniFrontFiles = true;
                                          fileCniFront = result.files.first;
                                        });

                                        PlatformFile file = result.files.first;

                                        final data = await uploadFile(file);

                                        if (data.successResponse != null) {
                                          fileCniFrontName =
                                              data.successResponse!;
                                          setState(() {
                                            isLoadingCniFrontFiles = false;
                                          });
                                        } else {
                                          ApiError<dynamic> error =
                                              data.errorResponse!;
                                          errorMessage(message: error.message);
                                          setState(() {
                                            isLoadingCniFrontFiles = false;
                                          });
                                        }
                                      }
                                    },
                                    onTapCniBackFile: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'pdf',
                                          'doc',
                                          'docx',
                                          'jpg',
                                          'png'
                                        ],
                                      );

                                      if (result != null) {
                                        setState(() {
                                          isLoadingCniBackFiles = true;
                                          fileCniBack = result.files.first;
                                        });

                                        PlatformFile file = result.files.first;

                                        final data = await uploadFile(file);

                                        if (data.successResponse != null) {
                                          fileCniBackName =
                                              data.successResponse!;
                                          setState(() {
                                            isLoadingCniBackFiles = false;
                                          });
                                        } else {
                                          ApiError<dynamic> error =
                                              data.errorResponse!;
                                          errorMessage(message: error.message);
                                          setState(() {
                                            isLoadingCniBackFiles = false;
                                          });
                                        }
                                      }
                                    },
                                    fileActeName: fileActe?.name,
                                    onTapActeFile: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'pdf',
                                          'doc',
                                          'docx',
                                          'jpg',
                                          'png'
                                        ],
                                      );

                                      if (result != null) {
                                        setState(() {
                                          isLoadingBirthCertificate = true;
                                          fileActe = result.files.first;
                                        });

                                        PlatformFile file = result.files.first;

                                        final data = await uploadFile(file);

                                        if (data.successResponse != null) {
                                          fileActeName = data.successResponse!;
                                          setState(() {
                                            isLoadingBirthCertificate = false;
                                          });
                                        } else {
                                          ApiError<dynamic> error =
                                              data.errorResponse!;
                                          errorMessage(message: error.message);
                                          setState(() {
                                            isLoadingBirthCertificate = false;
                                          });
                                        }
                                      }
                                    },
                                    onTapPassportIdentityFile: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'pdf',
                                          'doc',
                                          'docx',
                                          'jpg',
                                          'png'
                                        ],
                                      );
                                      if (result != null) {
                                        setState(() {
                                          isLoadingPassport = true;
                                          filePassportIdentity =
                                              result.files.first;
                                        });

                                        PlatformFile file = result.files.first;

                                        final data = await uploadFile(file);

                                        if (data.successResponse != null) {
                                          filePassportIdentityName =
                                              data.successResponse!;
                                          setState(() {
                                            isLoadingPassport = false;
                                          });
                                        } else {
                                          ApiError<dynamic> error =
                                              data.errorResponse!;
                                          errorMessage(message: error.message);
                                          setState(() {
                                            isLoadingPassport = false;
                                          });
                                        }
                                      }
                                    },
                                    onTapPassportVisaFile: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'pdf',
                                          'doc',
                                          'docx',
                                          'jpg',
                                          'png'
                                        ],
                                      );

                                      if (result != null) {
                                        setState(() {
                                          isLoadingPassportVisaPage = true;
                                          filePassportVisa = result.files.first;
                                        });

                                        PlatformFile file = result.files.first;

                                        final data = await uploadFile(file);

                                        if (data.successResponse != null) {
                                          filePassportVisaName =
                                              data.successResponse!;
                                          setState(() {
                                            isLoadingPassportVisaPage = false;
                                          });
                                        } else {
                                          ApiError<dynamic> error =
                                              data.errorResponse!;
                                          errorMessage(message: error.message);
                                          setState(() {
                                            isLoadingPassportVisaPage = false;
                                          });
                                        }
                                      }
                                    },
                                    onTapResidencePermitFile: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        withData: true,
                                        type: FileType.custom,
                                        allowedExtensions: [
                                          'pdf',
                                          'doc',
                                          'docx',
                                          'jpg',
                                          'png'
                                        ],
                                      );
                                      if (result != null) {
                                        setState(() {
                                          isLoadingProofofStayInCameroonFiles =
                                              true;
                                          fileResidencePermit =
                                              result.files.first;
                                        });

                                        PlatformFile file = result.files.first;

                                        final data = await uploadFile(file);

                                        if (data.successResponse != null) {
                                          fileResidencePermitName =
                                              data.successResponse!;
                                          setState(() {
                                            isLoadingProofofStayInCameroonFiles =
                                                false;
                                          });
                                        } else {
                                          ApiError<dynamic> error =
                                              data.errorResponse!;
                                          errorMessage(message: error.message);
                                          setState(() {
                                            isLoadingProofofStayInCameroonFiles =
                                                false;
                                          });
                                        }
                                      }
                                    },
                                  ),
                                ))
                              : BlocListener<CheckTransactionBloc,
                                  CheckTransactionState>(
                                  listener: (context, state) {
                                    if (state is LoadingCheckTransactionState) {
                                      LoadingDialog.show(
                                          context: context,
                                          message:
                                              "Vérification de la transaction.\n\nCette opération peut prendre du temps. \n\nVeuillez patienter s'il vous plait");
                                    } else if (state
                                        is LoadingOtherMethodState) {
                                      LoadingDialog.show(
                                          context: context,
                                          message:
                                              "Enregistrement de la demande. \n\nVeuillez patienter s'il vous plait");
                                    } else if (state
                                        is LoadingCheckTransactionState) {
                                      LoadingDialog.hide(context: context);
                                      LoadingDialog.show(
                                        context: context,
                                      );
                                    } else if (state
                                        is SuccessCheckTransactionState) {
                                      LoadingDialog.hide(context: context);
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext secondContext) {
                                          TextEditingController();
                                          return StatefulBuilder(builder:
                                              (stateContext, setStateContext) {
                                            return AlertDialog(
                                              scrollable: true,
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              title: Text(
                                                "PAIEMENT REUSSI",
                                                style: Theme.of(stateContext)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary),
                                              ),
                                              content: RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "Votre demande et votre paiement ont été reçus avec succès !\n",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall!
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSecondary),
                                                      children: [
                                                    TextSpan(
                                                        text:
                                                            'Nous vous remercions pour votre confiance\n\n',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary)),
                                                    TextSpan(
                                                        text:
                                                            'Vous serez contacté dans 48h au plus pour la suite.\n',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary)),
                                                    TextSpan(
                                                        text:
                                                            'Au cas contraire relancez-nous à l’adresse ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary)),
                                                    TextSpan(
                                                        text:
                                                            'support@easyproonline.com\n',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onPrimaryContainer)),
                                                    TextSpan(
                                                        text:
                                                            'ou par whatsapp au numéro ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary)),
                                                    TextSpan(
                                                        text:
                                                            '(+237) 650 22 99 50',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary)),
                                                  ])),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    context
                                                        .read<CriminalBloc>()
                                                        .add(DownloadPdf());
                                                  },
                                                  child: Text(
                                                      'TELECHARGEZ VOTRE REÇU',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium!
                                                          .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onError)),
                                                ),
                                              ],
                                            );
                                          });
                                        },
                                      );
                                    } else if (state
                                        is ErrorCheckTransactionState) {
                                      // LoadingDialog.hide(context: context);
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext secondContext) {
                                          // TextEditingController
                                          //     payNumberController =
                                          //     TextEditingController();
                                          return StatefulBuilder(builder:
                                              (stateContext, setStateContext) {
                                            return Form(
                                              key: _secondFormKey,
                                              child: AlertDialog(
                                                scrollable: true,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                title: Text(
                                                  "Echec",
                                                  style: Theme.of(stateContext)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondary),
                                                ),
                                                content: Text(
                                                  "Echec de la vérification réessayer",
                                                  style: Theme.of(stateContext)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondary),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      if (otherPaymentName !=
                                                          '') {
                                                        context
                                                            .read<
                                                                CheckTransactionBloc>()
                                                            .add(OnOtherPayment(
                                                                requestCode:
                                                                    requestCode,
                                                                receiptUrl:
                                                                    otherPaymentName));
                                                      } else {
                                                        CheckTransactionRequest
                                                            transaction =
                                                            CheckTransactionRequest(
                                                                requestCode:
                                                                    requestCode);
                                                        context
                                                            .read<
                                                                CheckTransactionBloc>()
                                                            .add(OnCheckStatusTransaction(
                                                                transaction:
                                                                    transaction));
                                                      }

                                                      // }
                                                    },
                                                    child: Text('Réessayer',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelLarge!
                                                            .copyWith(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onSecondary)),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        },
                                      );
                                    } else if (state
                                        is ReloadCheckTransactionState) {
                                      LoadingDialog.hide(context: context);

                                      MessageDialog.show(
                                          context: context,
                                          type: MessageType.Error,
                                          message: "Reload transaction");
                                    } else if (state
                                        is ErrorSucceedTransactionState) {
                                      LoadingDialog.hide(context: context);

                                      MessageDialog.show(
                                          context: context,
                                          type: MessageType.Error,
                                          message: state.errorMessage);
                                    }
                                  },
                                  child:
                                      BlocBuilder<CriminalBloc, CriminalState>(
                                          builder: (context, state) {
                                    return BlocListener<PaymentBloc,
                                        PaymentState>(
                                      listener: (secondContext, state) {
                                        if (state is LoadingPaymentState) {
                                          LoadingDialog.show(context: context);
                                        } else if (state
                                            is SuccessPaymentState) {
                                          LoadingDialog.hide(context: context);
                                          CheckTransactionRequest transaction =
                                              CheckTransactionRequest(
                                                  requestCode: requestCode);
                                          context
                                              .read<CheckTransactionBloc>()
                                              .add(OnCheckStatusTransaction(
                                                  transaction: transaction));
                                        } else if (state is ErrorPaymentState) {
                                          LoadingDialog.hide(context: context);
                                          MessageDialog.show(
                                              context: context,
                                              type: MessageType.Error,
                                              message: state.errorMessage);
                                        }
                                      },
                                      child: Invoice(
                                        acceptedNote: acceptedNote,
                                        requestCode:
                                            state.criminalRecordResult.code,
                                        expense: state.expenseResult,
                                        onAccepNoteChanged: (value) {
                                          setState(() {
                                            acceptedNote = value!;
                                          });
                                        },
                                        criminalRecord:
                                            state.criminalRecordResult,
                                        onNextStep: () {
                                          setState(() {
                                            requestCode =
                                                state.criminalRecordResult.code;
                                          });
                                          showSelectPaymentBottomSheet(
                                              requestCode: state
                                                  .criminalRecordResult.code);
                                        },
                                      ),
                                    );
                                  }),
                                ),
            ),
          ),
        ),
      ),
    );
  }

  void onCreateCriminalRecord() {
    final maritalStatus =
        maritalStatusSelected.name == 'Célibataire' ? "SINGLE" : "MARRIED";
    context.read<CriminalBloc>().add(CreateCriminalRecord(
        criminalRecordRequest: CriminalRecordRequest(
            civility: civilitySelected.name,
            fullName: fullNameTextController!.text,
            phoneNumber: numberTextController!.text,
            whatsappContact: whatsappTextController!.text,
            postalCode: postalCodeTextController!.text,
            email: emailTextController!.text,
            typeUser: typeUsager,
            regionOfBirth: regionSelected?.name ?? '',
            deliveryAddress: deliveryAddressTextController?.text ?? '',
            placeCalled: placeCalledTextController?.text ?? '',
            court: location,
            jobDescription: jobTextController!.text,
            maritalStatus: maritalStatus,
            location: residenceCondition == ResidenceCondition.cameroon
                ? "Je réside au cameroun"
                : "Je réside a l'étranger",
            residence: residenceCondition == ResidenceCondition.cameroon
                ? bornSelected.name
                : nationalitySelected.name,
            address: addressTextController!.text,
            contactPersonName: contactPersonTextController!.text,
            criminalRecordNumber: selectedChoiceNumber.value)));
  }

  void nextStep() {
    setState(() {
      step++;
    });
  }

  String? validatorDropdwon(
      {required DropdownModel? value, required String message}) {
    String? errorMessage;
    if (value?.name == "Sélectionner" || value == null) {
      setState(() {
        errorMessage = message;
      });
    }
    return errorMessage;
  }

  void showSelectPaymentBottomSheet({
    required String requestCode,
  }) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final appLocalizations = AppLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.largeRadius.w),
          topRight: Radius.circular(Dimens.largeRadius.w),
        ),
      ),
      builder: (primaryContext) {
        return StatefulBuilder(builder: (stfContext, stfSetState) {
          return Padding(
            padding: EdgeInsets.all(Dimens.padding.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizations!.payment_mode,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RawMaterialButton(
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          stfSetState(() {
                            paymentMode = 0;
                            otherPaymentName = '';
                          });
                          context.read<PaymentBloc>().add(
                              OnChangePaymentMethode(
                                  paymentMethod: PaymentMethode.orange));
                        },
                        child: Stack(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: paymentMode == 0
                                        ? Colors.green
                                        : Colors.transparent),
                                borderRadius:
                                    BorderRadius.circular(Dimens.radius.w),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimens.halfPadding.w),
                                child: SvgPicture.asset(
                                  Assets.logos.orange1,
                                  height: Dimens.svgSizeL.h,
                                  width: Dimens.svgSizeL.w,
                                  colorFilter:
                                      const ColorFilter.linearToSrgbGamma(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          stfSetState(() {
                            paymentMode = 1;
                            otherPaymentName = '';
                          });
                          context.read<PaymentBloc>().add(
                              OnChangePaymentMethode(
                                  paymentMethod: PaymentMethode.mtn));
                        },
                        child: Stack(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: paymentMode == 1
                                        ? Colors.green
                                        : Colors.transparent),
                                borderRadius:
                                    BorderRadius.circular(Dimens.radius.w),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimens.halfPadding.w),
                                child: SvgPicture.asset(Assets.logos.mtnMomo1,
                                    height: Dimens.svgSizeL.h,
                                    width: Dimens.svgSizeL.w,
                                    colorFilter:
                                        const ColorFilter.linearToSrgbGamma()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              stfSetState(() {
                                paymentMode = 2;
                              });
                              context.read<PaymentBloc>().add(
                                  OnChangePaymentMethode(
                                      paymentMethod: PaymentMethode.mtn));

                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                withData: true,
                                type: FileType.custom,
                                allowedExtensions: [
                                  'pdf',
                                  'doc',
                                  'docx',
                                  'jpg',
                                  'png'
                                ],
                              );
                              if (result != null) {
                                setState(() {
                                  filePaymentMethod = result.files.first;
                                });
                                stfSetState(() {
                                  isLoadingOtherPaymentFiles = true;
                                });

                                PlatformFile file = result.files.first;

                                final data = await uploadFile(file);

                                if (data.successResponse != null) {
                                  setState(() {
                                    otherPaymentName = data.successResponse!;
                                    isLoadingOtherPaymentFiles = false;
                                  });
                                  stfSetState(() {
                                    otherPaymentName = data.successResponse!;
                                  });
                                } else {
                                  ApiError<dynamic> error = data.errorResponse!;
                                  errorMessage(message: error.message);
                                  stfSetState(() {
                                    isLoadingOtherPaymentFiles = false;
                                  });
                                }
                              }
                            },
                            child: Stack(
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: paymentMode == 2
                                            ? Colors.green
                                            : Colors.transparent),
                                    borderRadius:
                                        BorderRadius.circular(Dimens.radius.w),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimens.halfPadding.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        isLoadingOtherPaymentFiles
                                            ? const Loader()
                                            : Image(
                                                width: 32,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                                image: AssetImage(Assets
                                                    .icons
                                                    .fluentPayment16RegularPng
                                                    .path)),
                                        SizedBox(
                                          width: Dimens.space.w,
                                        ),
                                        Text(
                                          appLocalizations.other_mode,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 32,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .error),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Dimens.space.h,
                          ),
                          if (otherPaymentName != '')
                            Text(
                              'Le fichier a bien été join.\n Cliquez sur continuer',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: Dimens.tripleSpace.h,
                      ),
                      Button(
                          type: ButtonType.primary,
                          onPressed: () {
                            if (paymentMode == 0 || paymentMode == 1) {
                              AutoRouter.of(context).pop();
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext secondContext) {
                                  TextEditingController payNumberController =
                                      TextEditingController();
                                  return StatefulBuilder(
                                      builder: (stateContext, setStateContext) {
                                    return Form(
                                      key: formKey,
                                      child: AlertDialog(
                                        scrollable: true,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "NUMERO PAYEUR",
                                              style: Theme.of(stateContext)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary),
                                            ),
                                            Text(
                                              "(quelqu’un peut payer avec le numero d’un proche)",
                                              style: Theme.of(stateContext)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary),
                                            ),
                                          ],
                                        ),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SvgPicture.asset(
                                                  paymentMode == 0
                                                      ? Assets.logos.orange1
                                                      : Assets.logos.mtnMomo1,
                                                  height: 12,
                                                  width: 12,
                                                  colorFilter: const ColorFilter
                                                      .linearToSrgbGamma(),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimens.halfSpace.h,
                                            ),
                                            Input(
                                              hintText: 'Votre numéro',
                                              controller: payNumberController,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: ValidationBuilder()
                                                  .required()
                                                  .build(),
                                              onChanged: (value) => context
                                                  .read<PaymentBloc>()
                                                  .add(OnChangePhonePayment(
                                                      phone: value)),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              AutoRouter.of(context).pop();
                                            },
                                            child: Text('Quitter',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary)),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              if (formKey.currentState
                                                      ?.validate() ==
                                                  true) {
                                                AutoRouter.of(context).pop();

                                                context.read<PaymentBloc>().add(
                                                    OnCheckoutPayment(
                                                        phone:
                                                            payNumberController
                                                                .text,
                                                        requestCode:
                                                            requestCode,
                                                        currencyCode: 'XAF'));
                                                AutoRouter.of(context).pop();
                                              }
                                            },
                                            child: Text('Envoyer',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary)),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                                },
                              );
                            } else if (paymentMode == 2) {
                              context.read<CheckTransactionBloc>().add(
                                  OnOtherPayment(
                                      receiptUrl: otherPaymentName,
                                      requestCode: requestCode));
                            } else {
                              MessageDialog.show(
                                  context: context,
                                  type: MessageType.Error,
                                  message: appLocalizations.payment_mode);
                            }
                          },
                          text: otherPaymentName != ''
                              ? appLocalizations.continuer
                              : appLocalizations.paye)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    displayBottomSheet(
        context: context,
        height: MediaQuery.of(context).size.height * .25,
        children: [
          Text(
            AppLocalizations.of(context)!.choose_language,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          SizedBox(height: Dimens.mediumSpace.h),
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: Language.values.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.read<LanguageBloc>().add(
                            ChangeLanguage(
                              selectedLanguage: Language.values[index],
                            ),
                          );
                      Future.delayed(const Duration(milliseconds: 300))
                          .then((value) => Navigator.of(context).pop());
                    },
                    title: Text(
                      Language.values[index].text,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    trailing: Language.values[index] == state.selectedLanguage
                        ? Icon(
                            Icons.check_circle_rounded,
                            color: Theme.of(context).primaryColor,
                          )
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.radius.w),
                      side: Language.values[index] == state.selectedLanguage
                          ? BorderSide(
                              color: Theme.of(context).primaryColor, width: 1)
                          : BorderSide(
                              color: Theme.of(context).colorScheme.onBackground,
                              width: 0.5),
                    ),
                    tileColor: Language.values[index] == state.selectedLanguage
                        ? Theme.of(context).primaryColor.withOpacity(0.05)
                        : null,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: Dimens.mediumSpace.h);
                },
              );
            },
          ),
        ]);
  }

  void errorMessage({required String message}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
