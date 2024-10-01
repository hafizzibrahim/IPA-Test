import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<File?> identityCardFile = Rx<File?>(null);
  final Rx<File?> studentCardFile = Rx<File?>(null);
  Rx<String?> profileImagePath = Rx<String?>(null);

  String get formattedDate {
    return selectedDate.value != null
        ? DateFormat('yyyy-MM-dd').format(selectedDate.value!)
        : '';
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

  final List<String> genderOptions = ['Choose your gender','Male', 'Female'];
  var selectedGender = ''.obs;

  final List<String> firstExpertise = [
    'Choose your first expertise',
    'Arkeologi, Sejarah, dan Budaya Maritim',
    'Bioteknologi, Biokimia, dan Pengolahan Produk Kelautan',
    'Bisnis Kelautan dan Perikanan',
    'Ekonomi Sumber Daya Kelautan',
    'Geologi Kelautan',
    'Hubungan Internasional dan Hukum Maritim',
    'Keamanan Maritim',
    'Kedokteran Kelautan',
    'Kesehatan Masyarakat Pesisir',
    'Klimatologi dan Meteorologi Kelautan',
    'Komunikasi dan Sosiologi Maritim',
    'Logistik dan Ekonomi Maritim',
    'Manajemen Pesisir Terpadu dan Tata Kelola Laut',
    'Olahraga Bahari',
    'Oseanografi Biologi, Oseanografi Perikanan',
    'Oseanografi Fisika, Pemodelan Laut',
    'Oseanografi Kimia, Pencemaran Laut',
    'Pariwisata Bahari',
    'Pendidikan Kelautan dan Perikanan',
    'Perikanan Budidaya',
    'Perikanan Tangkap',
    'Sistem Informasi, Penginderaan Jauh, dan Instrumentasi Kelautan',
    'Teknik Kelautan, Energi Laut',
    'Teknik Perkapalan, Sistem Perkapalan',
    'Transportasi Laut dan Pelayaran',
  ];
  var selectedFirstExpertise = ''.obs;

  final List<String> secondExpertise = [
    'Choose your second expertise',
    'Arkeologi, Sejarah, dan Budaya Maritim',
    'Bioteknologi, Biokimia, dan Pengolahan Produk Kelautan',
    'Bisnis Kelautan dan Perikanan',
    'Ekonomi Sumber Daya Kelautan',
    'Geologi Kelautan',
    'Hubungan Internasional dan Hukum Maritim',
    'Keamanan Maritim',
    'Kedokteran Kelautan',
    'Kesehatan Masyarakat Pesisir',
    'Klimatologi dan Meteorologi Kelautan',
    'Komunikasi dan Sosiologi Maritim',
    'Logistik dan Ekonomi Maritim',
    'Manajemen Pesisir Terpadu dan Tata Kelola Laut',
    'Olahraga Bahari',
    'Oseanografi Biologi, Oseanografi Perikanan',
    'Oseanografi Fisika, Pemodelan Laut',
    'Oseanografi Kimia, Pencemaran Laut',
    'Pariwisata Bahari',
    'Pendidikan Kelautan dan Perikanan',
    'Perikanan Budidaya',
    'Perikanan Tangkap',
    'Sistem Informasi, Penginderaan Jauh, dan Instrumentasi Kelautan',
    'Teknik Kelautan, Energi Laut',
    'Teknik Perkapalan, Sistem Perkapalan',
    'Transportasi Laut dan Pelayaran',
  ];
  var selectedSecondExpertise = ''.obs;



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

  void setGender(String? gender) {
    if (gender != null) {
      selectedGender.value = gender;
      genderController.text = gender;
    }
  }
  void setFirstExpertise(String? firstExpertise) {
    if (firstExpertise != null) {
      selectedFirstExpertise.value = firstExpertise;
      firstExpertiseController.text = firstExpertise;
    }
  }
  void setSecondExpertise(String? secondExpertise) {
    if (secondExpertise != null) {
      selectedSecondExpertise.value = secondExpertise;
      secondExpertiseController.text = secondExpertise;
    }
  }

  void setIdentityCardFile(File file) {
    identityCardFile.value = file;
  }

  void setStudentCardFile(File file) {
    studentCardFile.value = file;
  }

  void setProfileImagePath(String path) {
    profileImagePath.value = path;
  }
}
