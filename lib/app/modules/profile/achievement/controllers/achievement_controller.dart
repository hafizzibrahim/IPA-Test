import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../../../widget/custom_snackbar.dart';

class Achievements {
  final String award;
  final String appreciatior;
  final String eventName;
  final String eventLevel;
  final String date;

  Achievements({
    required this.award,
    required this.appreciatior,
    required this.eventName,
    required this.eventLevel,
    required this.date,
  });
}


class AchievementController extends GetxController {
  //TODO: Implement AchievementController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController awardC = TextEditingController();
  final TextEditingController appreciatorC = TextEditingController();
  final TextEditingController eventNameC = TextEditingController();
  final TextEditingController eventLevelC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  RxList<Achievements> achievement = <Achievements>[].obs;

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

  Future<void> selectDate(BuildContext context) async {
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
        dateC.text = formattedMonthYear;
      },
    );
  }

  void saveAchievement() {
    if (awardC.text.isNotEmpty &&
    appreciatorC.text.isNotEmpty &&
    eventNameC.text.isNotEmpty &&
    eventLevelC.text.isNotEmpty &&
    dateC.text.isNotEmpty) {
      achievement.add(Achievements(
        award: awardC.text,
        appreciatior: appreciatorC.text,
        eventName: eventNameC.text,
        eventLevel: eventLevelC.text,
        date: dateC.text
      ));
      clearAll();
      customSnackbar(
        'Success adding achievement history!',
      );
    } else {
      customSnackbar(
        'Please fill all fields!',
      );
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

  void deleteAchievement(int index) {
    achievement.removeAt(index);
    customSnackbar(
      'Success deleting education history!',
    );
  }

  void increment() => count.value++;
}
