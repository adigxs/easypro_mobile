import 'dart:io';

import 'package:easy_pro/src/datasource/models/language.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/laguage_state.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/language_bloc.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/language_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_pro/generated/assets.gen.dart';
import 'package:easy_pro/src/shared/utils/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class StepOne extends StatelessWidget {
  const StepOne(
      {super.key,
      required this.onNextStep,
      required this.tremsAccepted,
      this.onAccepTermeChanged});
  final Function() onNextStep;
  final bool tremsAccepted;
  final void Function(bool?)? onAccepTermeChanged;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return ListView(
      children: [
        Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: RawMaterialButton(
                onPressed: () => showLanguageBottomSheet(context),
                constraints: const BoxConstraints(),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.fullRadius.w),
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor)),
                  child: SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        context
                            .read<LanguageBloc>()
                            .state
                            .selectedLanguage
                            .value
                            .languageCode
                            .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: Dimens.doubleSpace.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(Assets.logos.logo.path),
                          width: 50,
                        ),
                        Text(
                          "EASYPRO",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).colorScheme.onError),
                        ),
                        Text(
                          appLocalizations!.welcome,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimens.tripleSpace.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: appLocalizations.step_desc_one,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                          children: [
                            TextSpan(
                                text: appLocalizations.step_desc_two,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground)),
                            TextSpan(
                                text: appLocalizations.step_desc_tree,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground))
                          ]),
                    ),
                    SizedBox(
                      height: Dimens.doubleSpace.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: appLocalizations.step_one_desc_four,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                          children: [
                            TextSpan(
                                text: appLocalizations.step_one_desc_five,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://easyproonline.com/terms-conditions');
                                  }),
                            TextSpan(
                                text: appLocalizations.step_one_desc_six,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground))
                          ]),
                    ),
                    SizedBox(
                      height: Dimens.doubleSpace.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Theme.of(context).colorScheme.background,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: tremsAccepted,
                          onChanged: onAccepTermeChanged,
                        ),
                        Flexible(
                          child: Text(
                            appLocalizations.confirm_condition,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.doubleSpace.h,
                ),
                Column(
                  children: [
                    Text(
                      appLocalizations.agree,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Button(
                              type: ButtonType.secondary,
                              onPressed: () {
                                if (Platform.isAndroid) {
                                  SystemNavigator.pop();
                                } else if (Platform.isIOS) {
                                  exit(0);
                                }
                              },
                              text: appLocalizations.decline),
                        ),
                        SizedBox(
                          width: Dimens.space.w,
                        ),
                        Expanded(
                          child: Button(
                              type: ButtonType.primary,
                              onPressed: tremsAccepted ? onNextStep : null,
                              text: appLocalizations.accept),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.space.h,
                ),
                Column(
                  children: [
                    Text(
                      appLocalizations.need_assistance,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: appLocalizations.write_whatsapp,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                          children: [
                            TextSpan(
                              text: ' (+237) 650 22 99 50 ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                            TextSpan(
                              text: appLocalizations.by_email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                            TextSpan(
                                text: "support@easyproonline.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    emailLaunch(
                                        email: 'support@easyproonline.com');
                                  }),
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.space.h,
                ),
              ],
            ),
          ],
        ),
      ],
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
}

Future<void> emailLaunch({required String email}) async {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    query: encodeQueryParameters(<String, String>{
      'subject':
          'Besoin d\'assistance : Problème de configuration de l\'application.',
    }),
  );
  launchUrl(
    emailLaunchUri,
    webOnlyWindowName: '_self',
  );
}

Future<void> launch(String url) async {
  await launchUrl(
    Uri.parse(url),
    webOnlyWindowName: '_self',
  );
}
