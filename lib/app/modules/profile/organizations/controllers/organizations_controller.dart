import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/themes.dart';

class Organizations {
  final String organization;
  final String position;
  final String startDate;
  final String endDate;

  Organizations({
    required this.organization,
    required this.position,
    required this.startDate,
    required this.endDate,
  });
}

class OrganizationsController extends GetxController {
  final organizationController = TextEditingController();
  final positionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  RxList<Organizations> organizations = <Organizations>[].obs;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  String formattedDate(DateTime? date) {
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

  void saveOrganizations() {
    if (organizationController.text.isNotEmpty &&
        positionController.text.isNotEmpty &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      organizations.add(Organizations(
          organization: organizationController.text,
          position: positionController.text,
          startDate: startDateController.text,
          endDate: endDateController.text
      ));
      clearAll();
      Get.snackbar(
          'Success',
          'Organizations experience added successfully',
          snackPosition: SnackPosition.BOTTOM
      );
    } else {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearAll() {
    organizationController.clear();
    positionController.clear();
    startDateController.clear();
    endDateController.clear();
    selectedDate.value = null;
  }

  void deleteOrganizations(int index) {
    organizations.removeAt(index);
  }

  @override
  void onClose() {
    organizationController.dispose();
    positionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}