import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownButtonForm<T extends dynamic> extends StatelessWidget {
  const DropdownButtonForm(
      {super.key,
      required this.items,
      required this.label,
      required this.onChangeValue,
      this.onChanged,
      this.selectedValue,
      this.validator});
  final List<T> items;
  final String label;
  final Function(String value) onChangeValue;
  final Function(T)? onChanged;
  final T? selectedValue;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      isExpanded: true,
      value: selectedValue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Dimens.radius.w)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            )),
        contentPadding: EdgeInsets.symmetric(vertical: Dimens.padding.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            )),
      ),
      hint: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
      ),
      style: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: Theme.of(context).colorScheme.onBackground),
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ))
          .toList(),
      validator: validator,
      onChanged: (value) {
        onChanged!(value as T);
      },
      onSaved: (value) {
        onChangeValue(value.toString());
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
