import 'package:get/get.dart';

import '../controllers/work_experiences_controller.dart';

class WorkExperiencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkExperiencesController>(
      () => WorkExperiencesController(),
    );
  }
}
