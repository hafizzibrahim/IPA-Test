import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_snackbar.dart';
import 'package:maritimmuda_connect/themes.dart';

class Educations {
  final String institution;
  final String major;
  final String level;
  final String gradDate;

  Educations({
    required this.institution,
    required this.major,
    required this.level,
    required this.gradDate,
  });
}

class EducationsController extends GetxController {
  final institutionController = TextEditingController();
  final majorController = TextEditingController();
  final levelController = TextEditingController();
  final gradController = TextEditingController();

  RxList<Educations> educations = <Educations>[].obs;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
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
        gradController.text = formattedMonthYear;
      },
    );
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

  void saveEducations () {
    if (institutionController.text.isNotEmpty &&
    majorController.text.isNotEmpty &&
    levelController.text.isNotEmpty &&
    gradController.text.isNotEmpty) {
      educations.add(Educations(
        institution: institutionController.text,
        major: majorController.text,
        level: levelController.text,
        gradDate: gradController.text
      ));
      clearAll();
      customSnackbar(
        'Success adding education history!',
      );
    }
    else {
      customSnackbar(
        'Please fill all fields!'
      );
    }
  }

  @override
  void onClose() {
    institutionController.dispose();
    majorController.dispose();
    levelController.dispose();
    gradController.dispose();
    super.onClose();
  }

  void clearAll() {
    institutionController.clear();
    majorController.clear();
    gradController.clear();
    levelController.clear();

    selectedLevel.value = '';
    selectedDate.value = null;
  }

  void deleteEducations(int index) {
    educations.removeAt(index);
    customSnackbar(
      'Success deleting education history!',
    );
  }

  void setLevel(String? level) {
    if (level != null) {
      selectedLevel.value = level;
      levelController.text = level;
    }
  }
}
