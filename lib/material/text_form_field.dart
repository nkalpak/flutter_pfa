import 'package:flutter/material.dart';

class PfaTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final InputDecoration decoration;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;

  const PfaTextFormField(
      {Key? key,
      this.validator,
      this.decoration = const InputDecoration(),
      this.controller,
      this.maxLines,
      this.keyboardType,
      this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: decoration.copyWith(filled: true, helperMaxLines: 2),
    );
  }
}
