import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maritimmuda_connect/app/modules/achievement/controllers/achievement_controller.dart';
import 'package:maritimmuda_connect/app/modules/achievement/views/achievement_view.dart';
import 'package:maritimmuda_connect/app/modules/educations/views/educations_view.dart';
import 'package:maritimmuda_connect/app/modules/home/controllers/home_controller.dart';
import 'package:maritimmuda_connect/app/modules/home/views/home_view.dart';
import 'package:maritimmuda_connect/app/modules/publication/views/publication_view.dart';
import 'package:maritimmuda_connect/app/modules/organizations/views/organizations_view.dart';
import 'package:maritimmuda_connect/app/modules/profile/views/profile_view.dart';
import 'package:maritimmuda_connect/app/modules/work_experiences/views/work_experiences_view.dart';
import 'package:maritimmuda_connect/app/modules/profile/controllers/profile_controller.dart';
import 'package:maritimmuda_connect/app/modules/educations/controllers/educations_controller.dart';
import 'package:maritimmuda_connect/app/modules/work_experiences/controllers/work_experiences_controller.dart';
import 'package:maritimmuda_connect/app/modules/organizations/controllers/organizations_controller.dart';

class MainDrawerController extends GetxController {
  var selectedIndex = 0.obs;
  var currentTitle = 'General'.obs;

  MainDrawerController() {
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(EducationsController());
    Get.put(WorkExperiencesController());
    Get.put(OrganizationsController());
    Get.put(AchievementController());
  }

  List<Widget> screens = [
    // Taruh halaman contoh const ProfileView() di sini
    ProfileView(),
    EducationsView(),
    WorkExperiencesView(),
    OrganizationsView(),
    AchievementView(),
    PublicationView()
  ];

  List<String> title = [
    'General',
    'Educations',
    'Work Experiences',
    'Organizations',
    'Achievements',
    'Publications',
    'Social Activities',
    'Researches',
  ];

  // Kalo mau pake icon dari flutter nya
  List<IconData> icon = [
    Icons.account_circle,
    Icons.school,
    Icons.work,
    Icons.group,
    Icons.emoji_events,
    Icons.menu_book,
    Icons.group_work,
    Icons.science,
  ];

  // Kalo mau pake icon SVG dari figma, uncomment code di bawah ini
  // List<Widget> svgIcons = [
  //   SvgPicture.asset('assets/icons/general.svg'),
  //   SvgPicture.asset('assets/icons/educations.svg'),
  //   SvgPicture.asset('assets/icons/work_experiences.svg'),
  //   SvgPicture.asset('assets/icons/organizations.svg'),
  //   SvgPicture.asset('assets/icons/achievements.svg'),
  //   SvgPicture.asset('assets/icons/publications.svg'),
  //   SvgPicture.asset('assets/icons/social_activities.svg'),
  //   SvgPicture.asset('assets/icons/researches.svg'),
  //   SvgPicture.asset('assets/icons/logout.svg'),
  // ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
    currentTitle.value = title[index];
  }
}
