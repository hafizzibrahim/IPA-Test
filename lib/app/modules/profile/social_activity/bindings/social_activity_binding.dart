import 'package:get/get.dart';

import '../controllers/social_activity_controller.dart';

class SocialActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialActivityController>(
      () => SocialActivityController(),
    );
  }
}
