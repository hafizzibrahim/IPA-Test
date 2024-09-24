import 'package:get/get.dart';

import '../modules/achievement/bindings/achievement_binding.dart';
import '../modules/achievement/views/achievement_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/job/bindings/job_binding.dart';
import '../modules/job/views/job_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/main_drawer/bindings/main_drawer_binding.dart';
import '../modules/main_drawer/views/main_drawer_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/main_drawer/bindings/main_drawer_binding.dart';
import '../modules/main_drawer/views/main_drawer_view.dart';
import '../modules/member/bindings/member_binding.dart';
import '../modules/member/views/member_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/publication/bindings/publication_binding.dart';
import '../modules/publication/views/publication_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_DRAWER,
      page: () => const MainDrawerView(),
      binding: MainDrawerBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER,
      page: () => const MemberView(),
      binding: MemberBinding(),
    ),
    GetPage(
      name: _Paths.ACHIEVEMENT,
      page: () => const AchievementView(),
      binding: AchievementBinding(),
    ),
    GetPage(
      name: _Paths.PUBLICATION,
      page: () => const PublicationView(),
      binding: PublicationBinding(),
    ),
    GetPage(
      name: _Paths.JOB,
      page: () => const JobView(),
      binding: JobBinding(),
    ),
  ];
}
