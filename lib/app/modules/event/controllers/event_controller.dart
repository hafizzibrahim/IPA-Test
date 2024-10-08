import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/event/views/category_event.dart';
import 'package:maritimmuda_connect/app/modules/event/views/list_event_view.dart';

class EventController extends GetxController
    with GetSingleTickerProviderStateMixin
{

  late TabController tabController;
  var selectedIndex = 0.obs;

  List<String> title = [
    'All',
    'Competetion',
    'Seminar',
    'Environment Simulation',
    'Forum',
    'Training',
    'Community Development'
  ];

  List<Widget> screens = [
    const ListEventView(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),

  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 7, vsync: this);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
  }

  void setSelectedIndex(int index) {
    tabController.index = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }









// final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   void increment() => count.value++;


}
