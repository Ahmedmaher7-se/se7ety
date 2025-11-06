import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.hint,
    this.validator,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    required this.controller,
  });

  final String? hint;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool readOnly;
  final Function()? onTap;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
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
        hintText: widget.hint,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(_obscureText ? Icons.visibility : Icons.visibility_off )],
          ),
        ),
      ),
    );
  }
}
