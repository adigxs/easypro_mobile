// ignore_for_file: library_private_types_in_public_api

import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';

class Switching extends StatelessWidget {
  final animationDuration = const Duration(milliseconds: 500);
  final bool? isEnabled;
  final VoidCallback onTap;

  const Switching({
    Key? key,
    this.isEnabled = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 24,
        width: 50.w,
        duration: animationDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.trippleRadius),
          color: isEnabled!
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          border: Border.all(
              color: Theme.of(context).colorScheme.surface, width: 0.1),
        ),
        child: AnimatedAlign(
          duration: animationDuration,
          alignment: isEnabled! ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.smPadding.w),
            child: Container(
              width: Dimens.doubleSpace.w,
              height: Dimens.doubleSpace.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isEnabled!
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
