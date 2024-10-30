import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maritimmuda_connect/app/data/models/request/general_request.dart';
import 'package:maritimmuda_connect/app/data/models/response/general_response.dart';
import 'package:maritimmuda_connect/app/data/services/general_service.dart';
import 'package:maritimmuda_connect/app/data/utils/province.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_snackbar.dart';
import 'package:maritimmuda_connect/themes.dart';

class ProfileController extends GetxController {
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final provincialOrgController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final linkedInController = TextEditingController();
  final instagramController = TextEditingController();
  final firstExpertiseController = TextEditingController();
  final secondExpertiseController = TextEditingController();
  final addressController = TextEditingController();
  final residenceAddressController = TextEditingController();
  final bioController = TextEditingController();

  final List<String> genderOptions = ["Choose your gender", 'Male', 'Female'];
  final List<String> firstExpertise = [];
  final List<String> secondExpertise = [];
  final Rx<File?> identityCardFile = Rx<File?>(null);
  final Rx<File?> studentCardFile = Rx<File?>(null);
  final Rx<File?> profileImageFile = Rx<File?>(null);
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<int?> selectedMonth = Rx<int?>(null);
  Rx<int?> selectedYear = Rx<int?>(null);
  Map<String, int> expertiseMap = {};
  int indexCounter = 0;
  var selectedFirstExpertise = 0.obs;
  var selectedSecondExpertise = 0.obs;
  var generalData = GeneralResponse().obs;
  var isLoading = false.obs;
  var selectedGender = 1.obs;
  var province = 1.obs;

  String get formattedDate {
    return selectedDate.value != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate.value!)
        : '';
  }

  @override
  void onInit() {
    super.onInit();
    fetchGeneral();
  }

  void setGender(String? value) {
    if (value != null) {
      selectedGender.value = genderOptions.indexOf(value);
    }
  }

  void setFirstExpertise(String? value) {
    if (value != null) {
      selectedFirstExpertise.value = firstExpertise.indexOf(value);
    }
  }

  void setSecondExpertise(String? value) {
    if (value != null) {
      selectedSecondExpertise.value = secondExpertise.indexOf(value);
    }
  }

  void setIdentityCardFile(File file) {
    identityCardFile.value = file;
  }

  void setStudentCardFile(File file) {
    studentCardFile.value = file;
  }

  void setProfileImagePath(File file) {
    profileImageFile.value = file;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dateOfBirthController.text = formattedDate;
    }
  }

  void expertiseMapping(GeneralResponse data) {
    data.expertises?.forEach((id, expertise) {
      if (!expertiseMap.containsKey(expertise)) {
        expertiseMap[expertise] = indexCounter;
        firstExpertise.add(expertise);
        secondExpertise.add(expertise);
        indexCounter++;
      }
    });

    if (data.user?.firstExpertiseId != null) {
      var firstExpertiseId = data.user!.firstExpertiseId.toString();
      selectedFirstExpertise.value =
          expertiseMap[data.expertises?[firstExpertiseId] ?? ""] ?? 0;
    }
    if (data.user?.secondExpertiseId != null) {
      var secondExpertiseId = data.user!.secondExpertiseId.toString();
      selectedSecondExpertise.value =
          expertiseMap[data.expertises?[secondExpertiseId] ?? ""]! + 1;
    }
  }

  void setAllController() {
    emailController.text = generalData.value.user?.email ?? '';
    // provincialOrgController.text =
    //     provinceOptions[generalData.value.user?.provinceId ?? 1];
    placeOfBirthController.text = generalData.value.user?.placeOfBirth ?? '';
    dateOfBirthController.text = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(generalData.value.user!.dateOfBirth.toString()));
    linkedInController.text = generalData.value.user?.linkedinProfile ?? '';
    instagramController.text = generalData.value.user?.instagramProfile ?? '';
    addressController.text = generalData.value.user?.permanentAddress ?? '';
    residenceAddressController.text =
        generalData.value.user?.residenceAddress ?? '';
    bioController.text = generalData.value.user?.bio ?? '';
  }

  void fetchGeneral() async {
    try {
      isLoading.value = true;
      var data = await GeneralService().fetchGeneral();
      generalData.value = data;

      expertiseMapping(data);
      setAllController();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void updateGeneral(GeneralRequest request) async {
    try {
      isLoading.value = true;
      bool success = await GeneralService().updateGeneral(request);

      if (success) {
        // customSnackbar("Profile updated successfully");
        customSnackbar(
          "Profile update failed, please check your input field",
          secondaryRedColor,
        );
      } else {
        customSnackbar(
          "Profile update failed, please check your input field",
          secondaryRedColor,
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    genderController.dispose();
    provincialOrgController.dispose();
    placeOfBirthController.dispose();
    dateOfBirthController.dispose();
    linkedInController.dispose();
    instagramController.dispose();
    firstExpertiseController.dispose();
    secondExpertiseController.dispose();
    addressController.dispose();
    residenceAddressController.dispose();
    bioController.dispose();
    super.onClose();
  }

  void clearAll() {
    // emailController.clear();
    // genderController.clear();
    // provincialOrgController.clear();
    // placeOfBirthController.clear();
    // dateOfBirthController.clear();
    // linkedInController.clear();
    // instagramController.clear();
    // firstExpertiseController.clear();
    // secondExpertiseController.clear();
    // addressController.clear();
    // residenceAddressController.clear();
    // bioController.clear();
    // selectedGender.value = 0;
    // selectedFirstExpertise.value = 0;
    // selectedSecondExpertise.value = 0;
    // selectedDate.value = null;
    // identityCardFile.value = null;
    // studentCardFile.value = null;
    // profileImagePath.value = null;
  }
}
