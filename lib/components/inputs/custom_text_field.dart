import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    required this.controller,
  });

  final String? hint;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(hintText: hint, suffixIcon: suffixIcon),
    );
  }
}
