import 'package:get/get.dart';

import '../controllers/main_drawer_controller.dart';

class MainDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainDrawerController>(
      () => MainDrawerController(),
    );
  }
}
