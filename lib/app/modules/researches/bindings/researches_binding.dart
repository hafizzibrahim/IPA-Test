import 'package:get/get.dart';

import '../controllers/researches_controller.dart';

class ResearchesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResearchesController>(
      () => ResearchesController(),
    );
  }
}
