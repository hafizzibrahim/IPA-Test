import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_drawer.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../controllers/main_drawer_controller.dart';

class MainDrawerView extends GetView<MainDrawerController> {
  const MainDrawerView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: neutral02Color,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: const Text('General'),
        ),
        drawer: CustomDrawer(controller: controller),
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: controller.screens,
          ),
        ),
      ),
    );
  }
}
