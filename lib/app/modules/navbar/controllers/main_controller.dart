import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/profile/main_drawer/views/main_drawer_view.dart';

import '../../analytics/controllers/analytics_controller.dart';
import '../../analytics/views/analytics_view.dart';
import '../../catalog/controllers/catalog_controller.dart';
import '../../catalog/views/catalog_view.dart';
import '../../home/event/controllers/event_controller.dart';
import '../../home/views/home_view.dart';
import '../../profile/achievement/controllers/achievement_controller.dart';
import '../../profile/main_drawer/controllers/main_drawer_controller.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  MainController() {
    Get.put(MainDrawerController());
    Get.put(AchievementController());
    Get.put(CatalogController());
    Get.put(EventController());
    Get.put(AnalyticsController());
  }

  PageController pageController = PageController();

  int bottomNavIndex = 0;

  final List<String> iconTitles = [
    'Home',
    'Analytic',
    'Catalog',
    'Profile',
  ];

  final iconList = <IconData>[
    Icons.home,
    Icons.show_chart_rounded,
    Icons.shopping_bag,
    Icons.person,
  ];

  final AutoSizeGroup autoSizeGroup = AutoSizeGroup();

  final List<Widget> views = [
    const HomeView(),
    const AnalyticsView(),
    const CatalogView(),
    const MainDrawerView(),
  ];

  void updateIndex(int index) {
    bottomNavIndex = index;
    update(); 
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose(); // Membebaskan controller ketika ditutup
    super.onClose();
  }
}
