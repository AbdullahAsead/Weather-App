import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hText,
    this.pIcon,
    this.isEmail = false,
    this.controller,
  });
  final String hText;
  final Widget? pIcon;
  final bool isEmail;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is required';
        } else if (isEmail && !value.contains('@')) {
          return 'enter a vaild email';
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: pIcon,
        hintText: hText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
