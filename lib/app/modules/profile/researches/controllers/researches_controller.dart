import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResearchesController extends GetxController {
  //TODO: Implement AchievementController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController researchTitleC = TextEditingController();
  final TextEditingController roleC = TextEditingController();
  final TextEditingController affiliationC = TextEditingController();
  final TextEditingController sponsorC = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

  String get formattedStartDate {
    return selectedStartDate.value != null
        ? DateFormat('yyyy-MM-dd').format(selectedStartDate.value!)
        : '';
  }

  String get formattedEndDate {
    return selectedEndDate.value != null
        ? DateFormat('yyyy-MM-dd').format(selectedEndDate.value!)
        : '';
  }

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedStartDate.value) {
      selectedStartDate.value = picked;
      startDateController.text = formattedStartDate;
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedEndDate.value) {
      selectedEndDate.value = picked;
      endDateController.text = formattedEndDate;
    }
  }


  final count = 0.obs;

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
    researchTitleC.dispose();
    roleC.dispose();
    sponsorC.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  void increment() => count.value++;
}
