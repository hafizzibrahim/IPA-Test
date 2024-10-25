import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../../../widget/custom_snackbar.dart';

class SocialActivity {
  final String program;
  final String institution;
  final String role;
  final String startDate;
  final String endDate;

  SocialActivity({
    required this.program,
    required this.institution,
    required this.role,
    required this.startDate,
    required this.endDate,
  });
}

class SocialActivityController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController programController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  RxList<SocialActivity> socialActivity = <SocialActivity>[].obs;

  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

  String formatDate(DateTime? date) {
    return date != null ? DateFormat('MMMM yyyy').format(date) : '';
  }

  Rx<int?> selectedMonth = Rx<int?>(null);
  Rx<int?> selectedYear = Rx<int?>(null);

  String get formattedMonthYear {
    if (selectedMonth.value != null && selectedYear.value != null) {
      return DateFormat('MMMM yyyy')
          .format(DateTime(selectedYear.value!, selectedMonth.value!));
    } else {
      return '';
    }
  }

  Future<void> selectStartDate(BuildContext context) async {
    showMonthPicker(
      context,
      initialSelectedMonth: selectedMonth.value ?? DateTime.now().month,
      initialSelectedYear: selectedYear.value ?? DateTime.now().year,
      firstYear: 1900,
      lastYear: DateTime.now().year,
      selectButtonText: 'OK',
      cancelButtonText: 'Cancel',
      highlightColor: primaryBlueColor,
      textColor: Colors.black,
      contentBackgroundColor: neutral01Color,
      dialogBackgroundColor: Colors.white,
      onSelected: (month, year) {
        selectedMonth.value = month;
        selectedYear.value = year;
        startDateController.text = formattedMonthYear;
      },
    );
  }

  Future<void> selectEndDate(BuildContext context) async {
    showMonthPicker(
      context,
      initialSelectedMonth: selectedMonth.value ?? DateTime.now().month,
      initialSelectedYear: selectedYear.value ?? DateTime.now().year,
      firstYear: 1900,
      lastYear: DateTime.now().year,
      selectButtonText: 'OK',
      cancelButtonText: 'Cancel',
      highlightColor: primaryBlueColor,
      textColor: Colors.black,
      contentBackgroundColor: Colors.white,
      dialogBackgroundColor: neutral01Color,
      onSelected: (month, year) {
        selectedMonth.value = month;
        selectedYear.value = year;
        endDateController.text = formattedMonthYear;
      },
    );
  }

  final count = 0.obs;

  void saveSocialActivity() {
    if (programController.text.isNotEmpty &&
    institutionController.text.isNotEmpty &&
    roleController.text.isNotEmpty &&
    startDateController.text.isNotEmpty &&
    endDateController.text.isNotEmpty) {
      socialActivity.add(SocialActivity(
        program: programController.text,
        institution: institutionController.text,
        role: roleController.text,
        startDate: startDateController.text,
        endDate: endDateController.text
      ));
      clearAll();
      customSnackbar(
        'Success adding social activity history!',
      );
    } else {
      customSnackbar(
        'Please fill all fields!',
      );
    }
  }

  void clearAll() {
    programController.clear();
    institutionController.clear();
    roleController.clear();
    startDateController.clear();
    endDateController.clear();

    selectedStartDate.value = null;
    selectedStartDate.value = null;
  }

  void deleteSocialActivity(int index) {
    socialActivity.removeAt(index);
    customSnackbar(
      'Success deleting education history!',
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    programController.dispose();
    institutionController.dispose();
    roleController.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  void increment() => count.value++;
}
