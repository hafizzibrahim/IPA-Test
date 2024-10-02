import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/e_kta/views/e_kta_view.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      body: Obx(
        () => controller.viewList[controller.bottomNavIndex.value],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryDarkBlueColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.credit_card,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(EKtaView());
          controller.fabAnimationController.reset();
          controller.borderRadiusAnimationController.reset();
          controller.borderRadiusAnimationController.forward();
          controller.fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          itemCount: controller.iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? colors.primary : Colors.grey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  controller.iconList[index],
                  size: 24,
                  color: primaryDarkBlueColor,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    controller.titleList[index],
                    maxLines: 1,
                    style: TextStyle(color: color),
                  ),
                )
              ],
            );
          },
          backgroundColor: Colors.white,
          activeIndex: controller.bottomNavIndex.value,
          splashColor: colors.primary,
          notchAndCornersAnimation: controller.borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 16,
          rightCornerRadius: 16,
          onTap: controller.onBottomNavTap,
          hideAnimationController: controller.hideBottomBarAnimationController,
          shadow: BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: colors.primary,
          ),
        ),
      ),
    );
  }
}
