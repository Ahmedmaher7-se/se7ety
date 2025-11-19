import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    required this.controller, this.prefixIcon,
  });

  final String? hintText;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool readOnly;
  final Function()? onTap;
  final Widget? prefixIcon;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      onTap: widget.onTap,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            ],
          ),
        ),
      ),
    );
  }
}
