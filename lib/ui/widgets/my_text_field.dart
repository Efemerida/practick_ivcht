import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.errorText,
    this.obscureText = false,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final String? errorText;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      style: TextStyle(fontSize: 18),
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        errorText: widget.errorText,
        floatingLabelStyle: TextStyle(color: Colors.lime.shade600),
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
