import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  var isLoading = false.obs;
  var isAuthenticated = false.obs;
  var obscureText = true.obs;
  var isCheckField = false.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void validateEmail(String value) {
    formKey.currentState!.validate();
    checkField();
  }

  void validatePassword(String value) {
    formKey.currentState!.validate();
    checkField();
  }

  void checkField() {
    if (emailC.text.isEmpty && passwordC.text.isEmpty) {
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

  String? validatePasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 7) {
      return "Password must be at least 7 characters long";
    } else if (!RegExp(r'\d').hasMatch(value)) {
      return "Password must contain at least one digit";
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
    emailC.dispose();
    passwordC.dispose();
  }

  // Jalanin ini kalo logout
  // void logout() async {
  //   await UserPreferences().logout();
  // }
}
