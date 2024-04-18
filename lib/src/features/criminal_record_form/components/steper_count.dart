import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';

class SteperCount extends StatelessWidget {
  const SteperCount({super.key, required this.number, required this.isActive});
  final int number;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.fullRadius.w),
          color: isActive
              ? Theme.of(context).colorScheme.outline
              : Theme.of(context).colorScheme.surface),
      child: SizedBox(
        height: Dimens.tripleSpace.w,
        width: Dimens.tripleSpace.w,
        child: Center(
          child: Text("$number",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.background)),
        ),
      ),
    );
  }
}
