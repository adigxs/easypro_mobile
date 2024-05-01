import 'dart:io';

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
    return Column(
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
                  'Bienvenue chez EASYPRO !',
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
                  text: "Recevez votre extrait casier judiciaire ",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground),
                  children: [
                    TextSpan(
                        text: "Camerounais ",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.onBackground)),
                    TextSpan(
                        text:
                            "en mains propres, sans voyager ou faire voyager un proche vers votre département de naissance et, économisez de l’argent, gagnez en temps, énergie tout en évitant de prendre des risques inutiles !",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onBackground))
                  ]),
            ),
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text:
                      "Veuillez prendre connaissance de nos termes et conditions d’utilisation en suivant ",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground),
                  children: [
                    TextSpan(
                        text: "ce lien ",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launch('https://easyproonline.com/privacy-policy');
                          }),
                    TextSpan(
                        text: "et confirmez ci-dessous",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onBackground))
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
                    "Je confirme avoir lu et compris les termes et conditions d’utilisation",
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
              'Acceptez-vous d’utiliser l’application EASYPRO ?',
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
                      text: "Je refuse"),
                ),
                SizedBox(
                  width: Dimens.space.w,
                ),
                Expanded(
                  child: Button(
                      type: ButtonType.primary,
                      onPressed: onNextStep,
                      text: "J'accepte"),
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
              'Besoin d’assistance ? ',
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
                  text: "Écrivez-nous par WhatsApp au ",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onBackground),
                  children: [
                    TextSpan(
                      text: ' (+237) 621 02 40 78 ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    TextSpan(
                      text:
                          '  (WhatsApp uniquement, pas d’appels SVP) ou par mail à l’adresse ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    TextSpan(
                        text: "easypro@easyproonline.com",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            emailLaunch(email: 'easypro@easyproonline.com');
                          }),
                  ]),
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
