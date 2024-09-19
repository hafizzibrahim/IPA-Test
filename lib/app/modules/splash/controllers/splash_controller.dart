import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/login/bindings/login_binding.dart';
import 'package:maritimmuda_connect/app/modules/login/views/login_view.dart';
import 'package:maritimmuda_connect/app/data/utils/user_preference.dart';

class SplashController extends GetxController {
  final UserPreferences _userPreferences = UserPreferences();

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    bool? loggedIn = await _userPreferences.getLoggedIn();

    // if (loggedIn == true) {
    // Get.offAll(
    //   () => const MainView(),
    //   binding: MainBinding(),
    //   transition: Transition.rightToLeft,
    //   duration: const Duration(milliseconds: 100),
    // );
    // } else {
    Get.offAll(
      () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 100),
    );
    // }
    // Ini kalo dah ada api
    // bool isSuccessful = await fetchMe();

    // if (isSuccessful) {
    // Get.offAll(
    //   () => const BottomNavView(),
    //   binding: BottomNavBinding(),
    //   transition: Transition.rightToLeft,
    //   duration: const Duration(milliseconds: 100),
    // );
    // } else {
    // await _userPreferences.logout();
  }
}
