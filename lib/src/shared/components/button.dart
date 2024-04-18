import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType { primary, secondary, error }

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.onPressed,
      required this.text,
      this.right,
      this.simple = false,
      this.iconPath,
      this.type = ButtonType.primary});
  final Function()? onPressed;
  final String text;
  final Widget? right;
  final bool simple;
  final String? iconPath;
  final ButtonType? type;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ButtonType.primary == type
            ? Theme.of(context).primaryColor
            : ButtonType.error == type
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.error,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radius.w),
        ),
        elevation: 1.0,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimens.padding.h, horizontal: Dimens.minPadding.w),
        child: Row(
          children: [
            if (iconPath != null)
              Expanded(flex: 1, child: SvgPicture.asset(iconPath!))
            else
              const Expanded(flex: 0, child: SizedBox()),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      textAlign:
                          iconPath != null ? TextAlign.start : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
