import 'package:flutter/material.dart';

import '../design_system/colors.dart';

class PfaFilterChip extends StatelessWidget {
  final Widget label;
  final bool selected;
  final void Function(bool isSelected) onSelected;

  const PfaFilterChip(
      {Key? key,
      required this.label,
      required this.selected,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: PfaColors.desaturatedGrey,
        selectedColor: PfaColors.darkBlue,
        showCheckmark: false,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? PfaColors.white : PfaColors.darkBlue,
        ),
        onSelected: onSelected,
        label: label,
        selected: selected);
  }
}
