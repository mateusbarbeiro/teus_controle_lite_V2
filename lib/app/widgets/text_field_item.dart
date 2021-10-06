import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/constants.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem(
    this.title, {
    Key? key,
    this.hint = "Digite aqui...",
    this.keyboardType = TextInputType.text,
    this.onSaved,
    this.controller,
    this.validator,
    this.onChanged
  }) : super(key: key);

  final String title;
  final String hint;
  final TextInputType keyboardType;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: kTitleStyle,
        hintText: hint,
      ),
      onSaved: onSaved,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
