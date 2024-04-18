import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key,
      this.hintText,
      this.border = true,
      this.fillColor,
      this.onVisibilityPassword,
      this.disabled = false,
      this.obscureText = false,
      this.visibility = false,
      this.filled = false,
      this.controller,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.validator,
      this.enabled,
      this.prefixIcon,
      this.maxLines,
      this.custom,
      this.onEditingComplete,
      this.autofocus = false,
      this.suffixIcon})
      : super(key: key);

  final String? hintText;
  final bool? visibility;
  final bool? obscureText;
  final bool? disabled;
  final Color? fillColor;
  final bool? border;
  final TextEditingController? controller;
  final VoidCallback? onVisibilityPassword;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final bool? filled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final bool? custom;
  final bool autofocus;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    if (custom == true) {
      return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        enabled: enabled,
        autofocus: autofocus,
        validator: validator,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: filled == true
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.onBackground), // Style du texte
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(
              Dimens.padding.w, Dimens.minPadding.w, 0, Dimens.minPadding.w),
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle:
              const TextStyle(color: Colors.grey), // Style du texte d'aide
        ),
      );
    }
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onChanged: onChanged,
      enabled: enabled,
      validator: validator,
      cursorColor: filled == true
          ? Theme.of(context).colorScheme.background
          : Theme.of(context).primaryColor,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: filled == true
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.onBackground),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                width: border! ? 0.5 : 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(Dimens.radius.w)),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: filled == true
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(Dimens.radius.w)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: 1,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(Dimens.radius.w)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 0.1,
              )),
          contentPadding: EdgeInsets.symmetric(
              horizontal: Dimens.padding.w,
              vertical: maxLines != null ? Dimens.halfPadding.h : 0),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
