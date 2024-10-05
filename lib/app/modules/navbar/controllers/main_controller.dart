import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/event/controllers/event_controller.dart';
import 'package:maritimmuda_connect/app/modules/profile/achievement/controllers/achievement_controller.dart';
import 'package:maritimmuda_connect/app/modules/analytics/views/analytics_view.dart';
import 'package:maritimmuda_connect/app/modules/catalog/controllers/catalog_controller.dart';
import 'package:maritimmuda_connect/app/modules/catalog/views/catalog_view.dart';
import 'package:maritimmuda_connect/app/modules/home/views/home_view.dart';
import 'package:maritimmuda_connect/app/modules/auth/login/views/login_view.dart';
import 'package:maritimmuda_connect/app/modules/profile/main_drawer/controllers/main_drawer_controller.dart';
import 'package:maritimmuda_connect/app/modules/profile/main_drawer/views/main_drawer_view.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  var bottomNavIndex = 0.obs;

  MainController() {
    Get.put(MainDrawerController());
    Get.put(AchievementController());
    Get.put(CatalogController());
    Get.put(EventController());
  }

  late AnimationController fabAnimationController;
  late AnimationController borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.home,
    Icons.show_chart_rounded,
    Icons.shopping_bag,
    Icons.person,
  ];

  final List<String> titleList = [
    "Home",
    "Analytics",
    "Catalog",
    "Profile",
  ];

  final List<Widget> viewList = [
    HomeView(),
    AnalyticsView(),
    CatalogView(),
    MainDrawerView(),
  ];

  @override
  void onInit() {
    super.onInit();
    fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          hideBottomBarAnimationController.reverse();
          fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          hideBottomBarAnimationController.forward();
          fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  void onBottomNavTap(int index) {
    bottomNavIndex.value = index;
  }
}
