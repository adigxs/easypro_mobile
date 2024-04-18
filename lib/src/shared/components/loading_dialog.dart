import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';

class LoadingDialog {
  static void show(
      {required BuildContext context, String message = "Patienter..."}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                width: Dimens.space.w,
              ),
              Expanded(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hide({required BuildContext context}) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
