import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class WorkExperiencesController extends GetxController {
 final positionController = TextEditingController();
 final institutionController = TextEditingController();
 final startDateController = TextEditingController();
 final endDateController = TextEditingController();

 Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

 String get formattedDate {
   return selectedDate.value != null
       ? DateFormat('yyyy-MM-dd').format(selectedDate.value!)
       : '';
 }

 Future<void> selectStartDate(BuildContext context) async {
   final DateTime? picked = await showDatePicker(
     context: context,
     initialDate: selectedDate.value ?? DateTime.now(),
     firstDate: DateTime(1900),
     lastDate: DateTime.now(),
   );
   if (picked != null && picked != selectedDate.value) {
     selectedDate.value = picked;
     startDateController.text = formattedDate;
   }
 }

 Future<void> selectEndDate(BuildContext context) async {
   final DateTime? picked = await showDatePicker(
     context: context,
     initialDate: selectedDate.value ?? DateTime.now(),
     firstDate: DateTime(1900),
     lastDate: DateTime.now(),
   );
   if (picked != null && picked != selectedDate.value) {
     selectedDate.value = picked;
     endDateController.text = formattedDate;
   }
 }

 void clearAll() {
   positionController.clear();
   institutionController.clear();
   startDateController.clear();
   endDateController.clear();

   selectedDate.value = null;
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
