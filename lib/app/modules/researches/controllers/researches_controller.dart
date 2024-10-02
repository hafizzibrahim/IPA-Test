import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ResearchesController extends GetxController {
  //TODO: Implement AchievementController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController researchTitleC = TextEditingController();
  final TextEditingController roleC = TextEditingController();
  final TextEditingController affiliationC = TextEditingController();
  final TextEditingController sponsorC = TextEditingController();
  final TextEditingController startC = TextEditingController();
  final TextEditingController endC = TextEditingController();


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
    startC.dispose();
    endC.dispose();
  }

  void increment() => count.value++;
}
