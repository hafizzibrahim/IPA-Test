import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_snackbar.dart';
import 'package:maritimmuda_connect/themes.dart';

class WorkExperience {
  final String position;
  final String institution;
  final String startDate;
  final String endDate;

  WorkExperience({
    required this.position,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });
}

class WorkExperiencesController extends GetxController {
  final positionController = TextEditingController();
  final institutionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

  RxList<WorkExperience> workExperiences = <WorkExperience>[].obs;

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


  void saveWorkExperience() {
    if (positionController.text.isNotEmpty &&
        institutionController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      workExperiences.add(WorkExperience(
        position: positionController.text,
        institution: institutionController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
      ));
      clearAll();
      customSnackbar(
        'Success adding work experience history!',
      );
    } else {
     customSnackbar(
        'Please fill all fields!'
      );
    }
  }

  void clearAll() {
    positionController.clear();
    institutionController.clear();
    startDateController.clear();
    endDateController.clear();
    selectedStartDate.value = null;
    selectedEndDate.value = null;
  }

  void deleteWorkExperience(int index) {
    workExperiences.removeAt(index);
    customSnackbar(
      'Success deleting education history!',
    );
  }

  @override
  void onClose() {
    positionController.dispose();
    institutionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}