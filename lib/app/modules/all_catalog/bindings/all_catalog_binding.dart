import 'package:get/get.dart';

import '../controllers/all_catalog_controller.dart';

class AllCatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCatalogController>(
      () => AllCatalogController(),
    );
  }
}
