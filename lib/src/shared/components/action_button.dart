import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final bool _hasBorders;

  const ActionButton({
    super.key,
    required this.icon,
    this.iconColor,
    this.iconSize,
    this.onPressed,
    this.backgroundColor,
  }) : _hasBorders = false;

  const ActionButton.withBorder({
    super.key,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
    required this.onPressed,
  }) : _hasBorders = true;

  final double? iconSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: _hasBorders ? BoxShape.rectangle : BoxShape.circle,
        color: backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: _hasBorders
                ? BorderRadius.circular(Dimens.radius.w)
                : BorderRadius.circular(360.0),
            side: const BorderSide(
              // color: Theme.of(context).extension<FigmaColors>()!.onAlternativeColor4!,
              width: 2.0,
            )),
        child: InkWell(
          onTap: onPressed,
          borderRadius: _hasBorders
              ? BorderRadius.circular(Dimens.radius.w)
              : BorderRadius.circular(360.0),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.appBarItemPadding),
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize ?? Dimens.actionButtonIconSize,
            ),
          ),
        ),
      ),
    );
  }
}
