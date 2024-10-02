import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PublicationController extends GetxController {
  //TODO: Implement PublicationController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleC = TextEditingController();
  final TextEditingController authorC = TextEditingController();
  final TextEditingController pubTypeC = TextEditingController();
  final TextEditingController publisherC = TextEditingController();
  final TextEditingController dateC = TextEditingController();
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
  }

  void increment() => count.value++;
}
