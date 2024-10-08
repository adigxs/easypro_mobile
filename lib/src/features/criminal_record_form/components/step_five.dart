import 'package:easy_pro/generated/assets.gen.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/features/criminal_record_form/components/label.dart';
import 'package:easy_pro/src/features/criminal_record_form/criminal_record_screen.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/shared/components/loader.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    // final isCamerounian = character == SingingCharacter.cameroonian ||
    //     character == SingingCharacter.cameroforeigner;
    final appLocalizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
        Label(
          title: appLocalizations!.copie_birth,
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
                    fileActeName ?? appLocalizations.click_here,
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
                  Label(
                    title: appLocalizations.copy_cni,
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
                              fileCniFrontName ?? appLocalizations.click_here,
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
                  Label(
                    title: appLocalizations.identity,
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
                              fileCniBackName ?? appLocalizations.click_here,
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
                      Label(
                        title: appLocalizations.passport1,
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
                                      appLocalizations.click_here,
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
                      Label(
                        title: appLocalizations.passport2,
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
                                      appLocalizations.click_here,
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
                      Label(
                        title: appLocalizations.live_cameroon,
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
                                      appLocalizations.click_here,
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
        Label(title: appLocalizations.marital_certificate),
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
                    fileWedCertificateName ?? appLocalizations.click_here,
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
                  onPressed: fileActeName != null ? onNextStep : null,
                  text: appLocalizations.note_frais),
            ),
          ],
        ),
        SizedBox(
          height: Dimens.doubleSpace.h,
        ),
      ],
    );
  }
}
