import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PublicationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleC = TextEditingController();
  final TextEditingController authorC = TextEditingController();
  final TextEditingController pubTypeC = TextEditingController();
  final TextEditingController publisherC = TextEditingController();
  final TextEditingController dateC = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  RxString selectedFileName = 'No File Chosen'.obs;

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

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      selectedFileName.value = result.files.single.name;
    } else {
      selectedFileName.value = 'No File Chosen.';
    }
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
