import 'dart:io';

import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/datasource/models/criminal_record_response.dart';
import 'package:easy_pro/src/datasource/models/expense_report_response.dart';
import 'package:easy_pro/src/shared/components/button.dart';
import 'package:easy_pro/src/shared/utils/common.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Invoice extends StatelessWidget {
  const Invoice(
      {super.key,
      required this.acceptedNote,
      this.onAccepNoteChanged,
      required this.expense,
      required this.criminalRecord,
      required this.onNextStep,
      required this.requestCode});

  final String requestCode;
  final bool acceptedNote;
  final void Function(bool?)? onAccepNoteChanged;
  final ExpenseReportResponse expense;
  final CriminalRecordResponse criminalRecord;
  final Function() onNextStep;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Note de frais pour l\'etablissement de l\'extrait du casier judiciare numéro: $requestCode',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Désignation',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                Text(
                  'Quantités',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                Text(
                  'P.U',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                Text(
                  'Montants',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text("Trésor public (timbre fiscal)",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text(('${expense.stamp.quantity}'),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text(('${expense.stamp.fee}'),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text('${expense.stamp.total}',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                )
              ],
            ),
            SizedBox(
              height: Dimens.space.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text("Débours (Frais de fouilles+\ntransport+relais)",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text(('${expense.disbursement.quantity}'),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text(('${expense.disbursement.fee}'),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text('${expense.disbursement.total}',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                )
              ],
            ),
            SizedBox(
              height: Dimens.space.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text("Frais de services",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text(('${expense.honorary.quantity}'),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text(('${expense.honorary.fee}'),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: Text('${expense.honorary.total}',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          )),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
                Text('${expense.total} ${expense.currencyCode}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.surface,
                        ))
              ],
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Theme.of(context).colorScheme.background,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: acceptedNote,
                  onChanged: onAccepNoteChanged,
                ),
                Flexible(
                  child: Text(
                    "j’accepte de payer la note de frais",
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
                      onPressed: acceptedNote == true ? onNextStep : null,
                      text: "Je Payer"),
                ),
              ],
            ),
            SizedBox(
              height: Dimens.doubleSpace.h,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.radius.w),
                  color:
                      Theme.of(context).colorScheme.outline.withOpacity(0.8)),
              child: Padding(
                padding: EdgeInsets.all(Dimens.doublePadding.w),
                child: Text(
                  "Après paiement ne quittez pas !\n\nTELECHARGEZ IMMEDIATEMENT VOTRE REçU DE PAIEMNT SVP\n\nCONCERVEZ-LE JUSQU’À LIVRAISON DE VOTRE DOCUMENT SVP",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onError),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
