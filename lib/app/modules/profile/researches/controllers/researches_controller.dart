import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/themes.dart';

class Researches {
  final String title;
  final String role;
  final String affiliation;
  final String sponsor;
  final String startDate;
  final String endDate;

  Researches({
    required this.title,
    required this.role,
    required this.affiliation,
    required this.sponsor,
    required this.startDate,
    required this.endDate,
  });
}

class ResearchesController extends GetxController {
  //TODO: Implement AchievementController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController researchTitleC = TextEditingController();
  final TextEditingController roleC = TextEditingController();
  final TextEditingController affiliationC = TextEditingController();
  final TextEditingController sponsorC = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  RxList<Researches> researches = <Researches>[].obs;

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

  @override
  void onInit() {
    super.onInit();
  }

  void saveResearches() {
    if (researchTitleC.text.isNotEmpty &&
    roleC.text.isNotEmpty &&
    affiliationC.text.isNotEmpty &&
    sponsorC.text.isNotEmpty &&
    startDateController.text.isNotEmpty &&
    endDateController.text.isNotEmpty) {
      researches.add(Researches(
        title: researchTitleC.text,
        role: roleC.text,
        affiliation: affiliationC.text,
        sponsor: sponsorC.text,
        startDate: startDateController.text,
        endDate: endDateController.text
      ));
      clearAll();
      Get.snackbar(
        'Success',
        'Researches history successfully added!',
        snackPosition: SnackPosition.BOTTOM
      );
    } else {
      Get.snackbar(
        'Error',
        'Please fill all fields!',
        snackPosition: SnackPosition.BOTTOM
      );
    }
  }

  void deleteResearches(int index) {
    researches.removeAt(index);
  }

  @override
  void onReady() {
    super.onReady();
  }

  void clearAll() {
    researchTitleC.clear();
    roleC.clear();
    affiliationC.clear();
    sponsorC.clear();
    startDateController.clear();
    endDateController.clear();

    selectedStartDate.value = null;
    selectedEndDate.value = null;
  }

  @override
  void onClose() {
    super.onClose();
    researchTitleC.dispose();
    roleC.dispose();
    sponsorC.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  void increment() => count.value++;
}
