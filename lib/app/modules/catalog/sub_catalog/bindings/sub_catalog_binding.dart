import 'package:get/get.dart';

import '../controllers/sub_catalog_controller.dart';

class SubCatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubCatalogController>(
      () => SubCatalogController(),
    );
  }
}
