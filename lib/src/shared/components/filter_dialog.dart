// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/datasource/models/dropdown_model.dart';
import 'package:easy_pro/src/shared/components/filter_choose.dart';
import 'package:easy_pro/src/shared/utils/common.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({
    Key? key,
    required this.allRegions,
    required this.onChangeRegionName,
    required this.onChangeDepartmentName,
    required this.onChangeCourtName,
    required this.onSendRequest,
    required this.onChangeStatusName,
    required this.departmentTextController,
    required this.centralFileTextController,
    required this.tpiTextController,
    required this.onChangeCentralFileName,
  }) : super(key: key);
  final List<DropdownModel> allRegions;

  final Function(DropdownModel) onChangeRegionName;
  final Function(String?)? onChangeDepartmentName;
  final Function(String?)? onChangeCourtName;
  final Function(DropdownModel) onChangeStatusName;
  final Function() onSendRequest;
  final TextEditingController departmentTextController;
  final TextEditingController centralFileTextController;
  final TextEditingController tpiTextController;
  final Function(DropdownModel) onChangeCentralFileName;

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<DropdownModel> allDepartment = [];
  String regionName = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: StatefulBuilder(builder: (context, StateSetter setStateDialog) {
        return Container(
          height: MediaQuery.of(context).size.height * .6,
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                    Text('Filtre de recherche',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground)),
                    SizedBox(
                      height: Dimens.tripleSpace.h,
                    ),
                    FilterChoose(
                      items: widget.allRegions,
                      label: "Region",
                      onChanged: (value) {
                        widget.onChangeRegionName(value);
                        setStateDialog(() {
                          regionName = value.name;
                        });
                      },
                    ),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Département",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownMenu<String>(
                                controller: widget.departmentTextController,
                                initialSelection:
                                    getDepartmentsByRegion(regionName).first,
                                onSelected: (String? value) =>
                                    widget.onChangeDepartmentName,
                                hintText: "Sélectionner",
                                expandedInsets: EdgeInsets.zero,
                                inputDecorationTheme: InputDecorationTheme(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimens.radius.w))),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 12),
                                dropdownMenuEntries:
                                    getDepartmentsByRegion(regionName)
                                        .map<DropdownMenuEntry<String>>(
                                            (String value) {
                                  return DropdownMenuEntry<String>(
                                    value: value,
                                    label: value,
                                  );
                                }).toList(),
                              ),
                            )),
                      ],
                    ),
                    // FilterChoose(
                    //   items: getDepartmentsByRegion(regionName)
                    //       .map((value) =>
                    //           DropdownModel(value: value, name: value))
                    //       .toSet()
                    //       .toList(),
                    //   label: "Département",
                    //   onChanged: widget.onChangeDepartmentName,
                    // ),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            "TPGI/TPI",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownMenu<String>(
                                controller: widget.tpiTextController,
                                initialSelection:
                                    getCourtByRegion(regionName).first,
                                onSelected: (String? value) =>
                                    widget.onChangeCourtName,
                                hintText: "Sélectionner",
                                expandedInsets: EdgeInsets.zero,
                                inputDecorationTheme: InputDecorationTheme(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimens.radius.w))),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 12),
                                dropdownMenuEntries:
                                    getCourtByRegion(regionName)
                                        .map<DropdownMenuEntry<String>>(
                                            (String value) {
                                  return DropdownMenuEntry<String>(
                                    value: value,
                                    label: value,
                                  );
                                }).toList(),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            "Fichier Central",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownMenu<String>(
                                controller: widget.centralFileTextController,
                                initialSelection: centralFiles.first,
                                onSelected: (String? value) =>
                                    widget.onChangeCentralFileName,
                                hintText: "Sélectionner",
                                expandedInsets: EdgeInsets.zero,
                                inputDecorationTheme: InputDecorationTheme(
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimens.radius.w))),
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontSize: 12),
                                dropdownMenuEntries: centralFiles
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                    value: value,
                                    label: value,
                                  );
                                }).toList(),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                    FilterChoose(
                      items: requestStatus,
                      label: "Status",
                      onChanged: (value) {
                        widget.onChangeStatusName(value);
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Quitter",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: Dimens.tripleSpace.w,
                        ),
                        InkWell(
                          onTap: () {
                            widget.onSendRequest();
                            // Navigator.pop(context);
                          },
                          child: Text(
                            "Appliquer",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
