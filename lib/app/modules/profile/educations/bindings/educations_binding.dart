import 'package:get/get.dart';

import '../controllers/educations_controller.dart';

class EducationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EducationsController>(
      () => EducationsController(),
    );
  }
}
