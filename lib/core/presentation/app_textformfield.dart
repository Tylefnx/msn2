import 'package:flutter/material.dart';
import 'package:msn2/core/presentation/app_text.dart';

class AppTextformfield extends StatelessWidget {
  final TextInputType? textInputType;
  final bool? obscureText;
  final String label;
  final TextEditingController controller;
  const AppTextformfield({
    super.key,
    required this.controller,
    this.textInputType,
    this.obscureText,
    required this.label,
  });

  factory AppTextformfield.normalText({
    required TextEditingController controller,
    required String label,
  }) {
    return AppTextformfield(
      controller: controller,
      textInputType: TextInputType.name,
      label: label,
    );
  }

  factory AppTextformfield.privateText({
    required TextEditingController controller,
    required String label,
  }) {
    return AppTextformfield(
      controller: controller,
      textInputType: TextInputType.name,
      obscureText: true,
      label: label,
    );
  }

  factory AppTextformfield.numbers({
    required TextEditingController controller,
    required String label,
  }) {
    return AppTextformfield(
      controller: controller,
      textInputType: TextInputType.number,
      label: label,
    );
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        label: AppText.bold(text: label),
      ),
    );
  }
}
