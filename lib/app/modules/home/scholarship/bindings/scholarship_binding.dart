import 'package:get/get.dart';

import '../controllers/scholarship_controller.dart';

class ScholarshipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScholarshipController>(
      () => ScholarshipController(),
    );
  }
}
