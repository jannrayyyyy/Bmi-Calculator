import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextFormField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration.collapsed(hintText: hintText),
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.length > 3) {
          return 'input must be 3 or lower';
        } else {
          return null;
        }
      },
    );
  }
}
