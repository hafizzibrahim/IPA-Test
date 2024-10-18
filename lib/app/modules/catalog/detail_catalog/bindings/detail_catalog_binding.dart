import 'package:get/get.dart';

import '../controllers/detail_catalog_controller.dart';

class DetailCatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCatalogController>(
      () => DetailCatalogController(),
    );
  }
}
