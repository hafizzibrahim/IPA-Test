import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AchievementController extends GetxController {
  //TODO: Implement AchievementController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController awardC = TextEditingController();
  final TextEditingController appreciatorC = TextEditingController();
  final TextEditingController eventNameC = TextEditingController();
  final TextEditingController eventLevelC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
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
      dateC.text = formattedDate;
    }
  }

  void clearAll() {
    awardC.clear();
    appreciatorC.clear();
    eventNameC.clear();
    eventLevelC.clear();
    dateC.clear();

    selectedDate.value = null;
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
    awardC.dispose();
    appreciatorC.dispose();
    eventNameC.dispose();
    eventLevelC.dispose();
    dateC.dispose();
  }

  void increment() => count.value++;
}
