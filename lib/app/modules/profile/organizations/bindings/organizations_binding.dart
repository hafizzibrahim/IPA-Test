import 'package:get/get.dart';

import '../controllers/organizations_controller.dart';

class OrganizationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrganizationsController>(
      () => OrganizationsController(),
    );
  }
}
