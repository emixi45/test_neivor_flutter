import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String? label;
  final TextInputType? type;
  final String? hint;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final VoidCallback? ontap;

  const FormInput({
    super.key,
    this.onChanged,
    this.validator,
    this.label,
    this.hint,
    this.type,
    String? hintText,
    this.ontap,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label != null ? Text(label!) : null,
        hintText: hint,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Este campo es obligatorio';
        if (value.trim().isEmpty) return 'Este campo no puede estar vacío';

        return null;
      },
    );
  }
}
