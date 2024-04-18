import 'package:easy_pro/generated/assets.gen.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Attachment extends StatelessWidget {
  const Attachment({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.fullRadius.w),
                  color:
                      Theme.of(context).colorScheme.outline.withOpacity(0.5)),
              child: Padding(
                padding: EdgeInsets.all(Dimens.padding.w),
                child: SizedBox(
                  width: Dimens.tripleSpace.w,
                  height: Dimens.tripleSpace.h,
                  child: SvgPicture.asset(Assets.icons.attachment1483,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor, BlendMode.srcIn)),
                ),
              ),
            ),
            SizedBox(
              width: Dimens.minSpace.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "Join",
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                )
              ],
            ),
          ],
        ),
        // SvgPicture.asset(Assets.icons.download,
        //     colorFilter: ColorFilter.mode(
        //         Theme.of(context).colorScheme.onBackground, BlendMode.srcIn))
      ],
    );
  }
}
