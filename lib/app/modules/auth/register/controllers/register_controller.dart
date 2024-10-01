import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPassC = TextEditingController();
  final List<String> genderOptions = ['Male', 'Female'];
  final List<String> provinceOptions = [
    'Jawa Barat',
    'Jawa Tengah',
    'Banten',
    'DKI Jakarta',
    'Jawa Timur',
    'Kalimantan Barat',
    'Sumatra Utara',
  ];

  var isLoading = false.obs;
  var isAuthenticated = false.obs;
  var obscureText = true.obs;
  var selectedGender = RxnString();
  var selectedProvince = RxnString();

  @override
  void onInit() {
    super.onInit();
    selectedGender.value = genderOptions[0];
    selectedProvince.value = provinceOptions[0];
  }

  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void setSelectedGender(String? value) {
    selectedGender.value = value;
  }

  void setSelectedProvince(String? value) {
    selectedProvince.value = value;
  }

  void validateName(String value) {
    formKey.currentState!.validate();
  }

  void validateEmail(String value) {
    formKey.currentState!.validate();
  }

  void validatePassword(String value) {
    formKey.currentState!.validate();
  }

  void validateConfirmPass(String value) {
    formKey.currentState!.validate();
  }

  bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  String? validateNameField(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    } else if (value.length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  String? validateEmailField(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!isValidEmail(value)) {
      return "Invalid email format";
    }
    return null;
  }

  String? validatePasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 7) {
      return "Password must be more than 7 characters";
    } else if (!RegExp(r'\d').hasMatch(value)) {
      return "Password must contain numbers";
    }
    return null;
  }

  String? validateConfirmPassField(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm password is required";
    } else if (value != passwordC.text) {
      return "Password does not match";
    }
    return null;
  }

  @override
  void onClose() {
    super.onClose();
    nameC.dispose();
    emailC.dispose();
    passwordC.dispose();
    confirmPassC.dispose();
  }
}
