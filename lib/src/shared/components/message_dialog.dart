// ignore_for_file: constant_identifier_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

enum MessageType { Error, Success }

class MessageDialog {
  static void show(
      {required BuildContext context,
      required MessageType type,
      Function()? onPressed,
      required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            type.name,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          content: Text(message,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
          actions: [
            TextButton(
              onPressed: onPressed ??
                  () {
                    AutoRouter.of(context).pop();
                  },
              child: Text('Ok',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary)),
            ),
          ],
        );
      },
    );
  }
}
