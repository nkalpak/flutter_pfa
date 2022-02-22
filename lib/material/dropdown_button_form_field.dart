import 'package:flutter/material.dart';

class PfaDropdownButtonFormField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final InputDecoration decoration;
  T? value;

  PfaDropdownButtonFormField(
      {Key? key,
      required this.items,
      required this.onChanged,
      this.decoration = const InputDecoration(),
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: decoration.copyWith(filled: true),
    );
  }
}
