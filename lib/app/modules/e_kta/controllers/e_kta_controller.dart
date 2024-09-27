import 'package:get/get.dart';

class EKtaController extends GetxController {
  var sliderValue = 0.0.obs;
  final RxInt currentPage = 0.obs;

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
