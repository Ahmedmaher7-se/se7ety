import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    required this.controller, this.prefixIcon, this.keyboardType,  this.textAlign = TextAlign.start,
  });

  final String? hintText;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool readOnly;
  final Function()? onTap;
  final Widget ? prefixIcon;
  final TextInputType? keyboardType;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardType ,
      textAlign: textAlign ,
      onTap: onTap,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon, prefixIcon: prefixIcon),
    );
  }
}
