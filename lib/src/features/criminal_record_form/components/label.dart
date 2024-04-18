import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.title, this.required = false});
  final String title;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
                text: title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onBackground),
                children: [
              required == true
                  ? TextSpan(
                      text: '*',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.error))
                  : const TextSpan()
            ])),
        SizedBox(
          height: Dimens.space.h,
        ),
      ],
    );
  }
}
