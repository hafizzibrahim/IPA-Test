import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EducationsController extends GetxController {
  final institutionController = TextEditingController();
  final majorController = TextEditingController();
  final levelController = TextEditingController();
  final gradController = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  String get formattedDate {
    return selectedDate.value != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate.value!)
        : '';
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      gradController.text = formattedDate;
    }
  }

  final List<String> levelOptions = [
    'Choose your education level',
    'Junior High School',
    'Senior High School',
    'Vocational High School',
    'Islamic Boarding High School',
    'Diploma III Degree',
    'Diploma IV Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Doctoral Degree'
  ];
  var selectedLevel = ''.obs;

  @override
  void onClose() {
    institutionController.dispose();
    majorController.dispose();
    levelController.dispose();
    gradController.dispose();
    super.onClose();
  }

  void setLevel(String? level) {
    if (level != null) {
      selectedLevel.value = level;
      levelController.text = level;
    }
  }
}
