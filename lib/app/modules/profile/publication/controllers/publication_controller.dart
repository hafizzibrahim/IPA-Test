import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../../../widget/custom_snackbar.dart';

class Publication {
  final String title;
  final String author;
  final String pubType;
  final String publisher;
  final String date;
  final String? titlePage;

  Publication({
    required this.title,
    required this.author,
    required this.pubType,
    required this.publisher,
    required this.date,
    this.titlePage,
  });
}

class PublicationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleC = TextEditingController();
  final TextEditingController authorC = TextEditingController();
  final TextEditingController pubTypeC = TextEditingController();
  final TextEditingController publisherC = TextEditingController();
  final TextEditingController dateC = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxList<Publication> publication = <Publication>[].obs;

  // Updated file related variables
  RxString selectedFileName = 'No File Chosen'.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString selectedImagePath = ''.obs;

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

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      selectedFileName.value = result.files.single.name;
      selectedImagePath.value = result.files.single.path!;
      selectedImage.value = File(result.files.single.path!);
    } else {
      selectedFileName.value = 'No File Chosen';
      selectedImagePath.value = '';
      selectedImage.value = null;
    }
  }

  void savePublications() {
    if (formKey.currentState!.validate() &&
        titleC.text.isNotEmpty &&
        authorC.text.isNotEmpty &&
        pubTypeC.text.isNotEmpty &&
        publisherC.text.isNotEmpty &&
        dateC.text.isNotEmpty) {
      publication.add(Publication(
        title: titleC.text,
        author: authorC.text,
        pubType: pubTypeC.text,
        publisher: publisherC.text,
        date: dateC.text,
        titlePage: selectedImagePath.value,
      ));
      clearAll();
      customSnackbar(
        'Success adding publication history',
      );
    } else {
      customSnackbar(
        'Please fill all fields!',
      );
    }
  }

  void deletePublication(int index) {
    publication.removeAt(index);
    customSnackbar(
      'Success deleting education history!',
    );
  }

  void clearAll() {
    titleC.clear();
    authorC.clear();
    pubTypeC.clear();
    publisherC.clear();
    dateC.clear();

    selectedDate.value = null;
    selectedFileName.value = 'No File Chosen';
    selectedImagePath.value = '';
    selectedImage.value = null;
  }

  @override
  void onClose() {
    titleC.dispose();
    authorC.dispose();
    pubTypeC.dispose();
    publisherC.dispose();
    dateC.dispose();
    super.onClose();
  }
}