import 'dart:io';

import 'package:easy_pro/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/services.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key, required this.onNextStep});
  final Function() onNextStep;

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
                  width: 100,
                ),
                Text(
                  "EASYPRO",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
            SizedBox(
              height: Dimens.tripleSpace.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Recevez votre extrait casier judiciaire ",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  children: [
                    TextSpan(
                        text: "Camerounais ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.underline,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground)),
                    TextSpan(
                        text:
                            "en main propre, sans voyager vers votre département d'origine.",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground))
                  ]),
            ),
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            Text(
              "Nos services sont tous prépayés.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            Text(
              "Vous pourrez téléchargez votre reçu à la fin du processus de sounission de votre demande.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            Text(
              "Acceptez-vous ces conditions d'utilisation ?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
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
        SizedBox(
          height: Dimens.space.h,
        ),
      ],
    );
  }
}
