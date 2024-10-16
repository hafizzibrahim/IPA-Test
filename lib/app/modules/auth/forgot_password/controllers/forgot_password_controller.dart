import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailC = TextEditingController();
  var isCheckField = false.obs;

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void validateEmail(String value) {
    formKey.currentState!.validate();
    checkField();
  }

  void checkField() {
    if (emailC.text.isEmpty) {
      isCheckField.value = false;
    } else {
      isCheckField.value = true;
    }
  }

  bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  String? validateEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!isValidEmail(value)) {
      return "Enter a valid email format";
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
    emailC.dispose();
  }
}
