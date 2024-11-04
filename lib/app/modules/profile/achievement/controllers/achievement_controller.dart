import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/app/data/models/request/achievements_request.dart';
import 'package:maritimmuda_connect/app/data/models/response/achievements_response.dart';
import 'package:maritimmuda_connect/app/data/services/achievements_service.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../../../widget/custom_snackbar.dart';

class Achievements {
  final String award;
  final String appreciator;
  final String eventName;
  final String eventLevel;
  final String date;

  Achievements({
    required this.award,
    required this.appreciator,
    required this.eventName,
    required this.eventLevel,
    required this.date,
  });
}


class AchievementController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController awardC = TextEditingController();
  final TextEditingController appreciatorC = TextEditingController();
  final TextEditingController eventNameC = TextEditingController();
  final TextEditingController eventLevelC = TextEditingController();
  final TextEditingController dateC = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  var isLoading = false.obs;
  var achievementsData = <AchievementsResponse>[].obs;

  String formatDate(DateTime? date) {
    return DateFormat('yyyy-MM').format(date!);
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
      initialSelectedMonth: selectedMonth.value ?? DateTime
          .now()
          .month,
      initialSelectedYear: selectedYear.value ?? DateTime
          .now()
          .year,
      firstYear: 1900,
      lastYear: DateTime
          .now()
          .year,
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

  void patchField(AchievementsResponse achievementsData) {
    awardC.text = achievementsData.awardName ?? '';
    appreciatorC.text = achievementsData.appreciator ?? '';
    eventNameC.text = achievementsData.awardName ?? '';
    eventLevelC.text = achievementsData.eventLevel ?? '';
    dateC.text = formatDate(achievementsData.achievedAt!);
  }

  void fetchAchievements() async {
    try {
      isLoading.value = true;
      var data = await AchievementsService().fetchAchievements();
      achievementsData.assignAll(data);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void createAchievements(AchievementsRequest request) async {
    print(request.toJson());
    try {
      isLoading.value = true;
      bool success = await AchievementsService().createAchievements(request);
      if (success) {
        fetchAchievements();
        clearAll();
        customSnackbar(
          'Success adding achievements history!',
        );
      } else {
        customSnackbar(
          'Failed adding achievements history!',
          secondaryRedColor,
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void deleteAchievements(int id) async {
    try {
      isLoading.value = true;
      bool success = await AchievementsService().deleteAchievements(id);

      if (success) {
        fetchAchievements();
        customSnackbar(
          'Success delete achievements!',
          null,
          const Duration(milliseconds: 800),
        );
      } else {
        customSnackbar(
          'Failed delete achievements!',
          secondaryRedColor,
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
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

  bool validateForm() {
    return formKey.currentState!.validate();
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
}
