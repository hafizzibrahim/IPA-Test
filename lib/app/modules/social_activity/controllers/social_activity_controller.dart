import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SocialActivityController extends GetxController {
  //TODO: Implement AchievementController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController awardC = TextEditingController();
  final TextEditingController appreciatorC = TextEditingController();
  final TextEditingController eventNameC = TextEditingController();
  final TextEditingController eventLevelC = TextEditingController();
  final TextEditingController dateC = TextEditingController();


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
