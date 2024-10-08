import 'dart:io';

import 'package:easy_pro/src/features/criminal_record_form/logic/language/language_bloc.dart';
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
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).colorScheme.onError),
                    ),
                    Text(
                      appLocalizations!.welcome,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).colorScheme.onBackground),
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
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground),
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
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground),
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
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: tremsAccepted,
                      onChanged: onAccepTermeChanged,
                    ),
                    Flexible(
                      child: Text(
                        appLocalizations.confirm_condition,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onBackground),
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground),
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
                                emailLaunch(email: 'support@easyproonline.com');
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
    );
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
