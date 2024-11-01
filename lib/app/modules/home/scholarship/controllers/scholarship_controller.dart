import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/data/models/response/scholarship_response.dart';
import 'package:maritimmuda_connect/app/data/services/scholarship_service.dart';

class ScholarshipController extends GetxController
  with GetSingleTickerProviderStateMixin {

  final count = 0.obs;
  var isLoading = false.obs;
  var scholarshipList = <Scholarship>[].obs;
  var searchQuery = "".obs;
  var filteredList = <Scholarship>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllScholarships();
  }

  void getAllScholarships() async {
    try {
      isLoading.value = true;
      var response = await ScholarshipService().getAllScholarship();
      scholarshipList.assignAll(response);
      filteredList.assignAll(scholarshipList);
    } catch (e) {
      print("Error fetch Scholarships");
    } finally {
      isLoading.value = false;
    }
  }


  void searchScholarship(String query) {
    searchQuery.value = query;
    var tempList = List<Scholarship>.from(scholarshipList);
    if (searchQuery.value.isNotEmpty) {
      tempList = tempList.where((scholar) {
        final matchName = scholar.name?.toLowerCase().contains(
            searchQuery.value.toLowerCase()
        ) ?? false;
        final matchProvider = scholar.providerName?.toLowerCase().contains(
            searchQuery.value.toLowerCase()
        ) ?? false;
        return matchName || matchProvider;
      }).toList();
    }

    filteredList.assignAll(tempList);

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
