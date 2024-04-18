import 'package:easy_pro/generated/assets.gen.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/label.dart';
import 'package:easy_pro/src/features/criminal_record_form/criminal_record_screen.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/shared/components/loader.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepFive extends StatelessWidget {
  const StepFive({
    super.key,
    required this.onTapCniFrontFile,
    required this.onTapCniBackFile,
    required this.fileCniFrontName,
    required this.fileCniBackName,
    required this.fileActeName,
    required this.onTapActeFile,
    this.fileWedCertificateName,
    required this.onTapWedCertificateFile,
    this.filePassportIdentityName,
    this.filePassportVisaName,
    this.fileResidencePermitName,
    required this.onTapPassportIdentityFile,
    required this.onTapPassportVisaFile,
    required this.onTapResidencePermitFile,
    this.character,
    required this.isLoadingBirthCertificate,
    required this.isLoadingPassport,
    required this.isLoadingPassportVisaPage,
    required this.isLoadingProofofStayInCameroonFiles,
    required this.onNextStep,
    required this.isLoadingCniBackFiles,
    required this.isLoadingCniFrontFiles,
    required this.isLoadingWeddingFiles,
  });

  final String? fileCniFrontName;
  final String? fileCniBackName;
  final String? fileWedCertificateName;
  final String? filePassportIdentityName;
  final String? filePassportVisaName;
  final String? fileResidencePermitName;
  final String? fileActeName;

  final Function() onTapCniFrontFile;
  final Function() onTapCniBackFile;
  final Function() onTapWedCertificateFile;
  final Function() onTapPassportIdentityFile;
  final Function() onTapPassportVisaFile;
  final Function() onTapResidencePermitFile;
  final Function() onTapActeFile;
  final Function() onNextStep;
  final SingingCharacter? character;

  final bool isLoadingBirthCertificate;
  final bool isLoadingPassport;
  final bool isLoadingPassportVisaPage;
  final bool isLoadingProofofStayInCameroonFiles;
  final bool isLoadingCniBackFiles;
  final bool isLoadingCniFrontFiles;
  final bool isLoadingWeddingFiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label(
          title: "Copie de l'acte de naissance (version scannée)",
          required: true,
        ),
        InkWell(
          onTap: onTapActeFile,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimens.minPadding.h,
                horizontal: Dimens.halfPadding.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    fileActeName ?? "Attaché le document ici!...",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                isLoadingBirthCertificate
                    ? const Loader()
                    : SvgPicture.asset(Assets.icons.paperclip2),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        character == SingingCharacter.cameroonian ||
                character == SingingCharacter.cameroforeigner
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Label(
                    title: "Copie CNI (recto ou copie complète)",
                    required: true,
                  ),
                  InkWell(
                    onTap: onTapCniFrontFile,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimens.minPadding.h,
                          horizontal: Dimens.halfPadding.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              fileCniFrontName ?? 'Attaché le document ici!...',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                          ),
                          isLoadingCniFrontFiles
                              ? const Loader()
                              : SvgPicture.asset(Assets.icons.paperclip2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.doubleSpace.h,
                  ),
                  const Label(
                    title: "Pièce d'identité (verso)",
                  ),
                  InkWell(
                    onTap: onTapCniBackFile,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimens.minPadding.h,
                          horizontal: Dimens.halfPadding.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              fileCniBackName ?? 'Attaché le document ici!...',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                          ),
                          isLoadingCniBackFiles
                              ? const Loader()
                              : SvgPicture.asset(Assets.icons.paperclip2),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.doubleSpace.h,
                  ),
                ],
              )
            : character == SingingCharacter.foreigner
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Label(
                        title: "Passport (Page identification)",
                      ),
                      InkWell(
                        onTap: onTapPassportIdentityFile,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimens.minPadding.h,
                              horizontal: Dimens.halfPadding.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  filePassportIdentityName ??
                                      'Attaché le document ici!...',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground),
                                ),
                              ),
                              isLoadingPassport
                                  ? const Loader()
                                  : SvgPicture.asset(Assets.icons.paperclip2),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimens.doubleSpace.h,
                      ),
                      const Label(
                        title: "Passport (Page de visa Cameroun)",
                      ),
                      InkWell(
                        onTap: onTapPassportVisaFile,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimens.minPadding.h,
                              horizontal: Dimens.halfPadding.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  filePassportVisaName ??
                                      'Attaché le document ici!...',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground),
                                ),
                              ),
                              isLoadingPassportVisaPage
                                  ? const Loader()
                                  : SvgPicture.asset(Assets.icons.paperclip2),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimens.doubleSpace.h,
                      ),
                      const Label(
                        title: "Preuve de séjour au Cameroun",
                      ),
                      InkWell(
                        onTap: onTapResidencePermitFile,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimens.minPadding.h,
                              horizontal: Dimens.halfPadding.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  fileResidencePermitName ??
                                      'Attaché le document ici!...',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground),
                                ),
                              ),
                              isLoadingProofofStayInCameroonFiles
                                  ? const Loader()
                                  : SvgPicture.asset(Assets.icons.paperclip2),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimens.doubleSpace.h,
                      ),
                    ],
                  )
                : const SizedBox(),
        const Label(
          title: "Acte de mariage (femmes mariées)",
        ),
        InkWell(
          onTap: onTapWedCertificateFile,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimens.minPadding.h,
                horizontal: Dimens.halfPadding.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    fileWedCertificateName ?? 'Attaché le document ici!...',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                isLoadingWeddingFiles
                    ? const Loader()
                    : SvgPicture.asset(Assets.icons.paperclip2),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        Row(
          children: [
            Flexible(
              child: Button(
                  type: ButtonType.primary,
                  onPressed: onNextStep,
                  text: "Continuer"),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        // Row(
        //   children: [
        //     Flexible(
        //       child: ElevatedButton(
        //         onPressed: onDownloadPdf,
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor: Theme.of(context).colorScheme.outline,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(Dimens.radius.w),
        //           ),
        //           elevation: 1.0,
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(
        //               vertical: Dimens.padding.h,
        //               horizontal: Dimens.minPadding.w),
        //           child: Stack(
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     "Télécharger la facture",
        //                     textAlign: TextAlign.center,
        //                     style: Theme.of(context)
        //                         .textTheme
        //                         .bodyMedium!
        //                         .copyWith(
        //                             fontWeight: FontWeight.w600,
        //                             color: Colors.white),
        //                   ),
        //                 ],
        //               ),
        //               Positioned(child: SvgPicture.asset(Assets.icons.download))
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // )
      ],
    );
  }
}
