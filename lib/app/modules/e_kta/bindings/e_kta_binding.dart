import 'package:get/get.dart';

import '../controllers/e_kta_controller.dart';

class EKtaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EKtaController>(
      () => EKtaController(),
    );
  }
}
