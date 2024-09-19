import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maritimmuda_connect/themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    super.key,
    this.hintText,
    this.suffixIcon,
    this.preffixIcon,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      maxLines: 1,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      cursorHeight: 15,
      style: regulerText12,
      decoration: InputDecoration(
        filled: true,
        fillColor: neutral02Color,
        hintText: hintText,
        prefixIcon: preffixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          fontSize: 11,
          color: neutral03Color,
          fontWeight: FontWeight.w500,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: secondaryRedColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryBlueColor, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: secondaryRedColor, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: neutral03Color, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: neutral03Color, width: 1.5),
        ),
      ),
    );
  }
}
