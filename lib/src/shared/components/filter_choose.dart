import 'package:easy_pro/src/datasource/models/dropdown_model.dart';
import 'package:easy_pro/src/shared/components/dropdown_button_form.dart';
import 'package:flutter/material.dart';

class FilterChoose extends StatelessWidget {
  const FilterChoose({
    Key? key,
    required this.items,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  final List<DropdownModel> items;
  final void Function(DropdownModel)? onChanged;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        Flexible(
          flex: 2,
          child: DropdownButtonForm<DropdownModel>(
            items: items,
            onChangeValue: (value) {},
            label: 'Sélectionner',
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
