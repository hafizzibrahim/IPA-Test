import 'package:get/get.dart';

class MemberController extends GetxController {
  var isVisible = false.obs;
  // Observable map to track which sections are expanded
  final expandedSections = <String, bool>{}.obs;

  // Observable map to store selected items for each section
  final selectedItems = <String, String>{}.obs;

  var isDraweVisible = false.obs;

  // List of available provinces
  final provinces = [
    "Jawa Barat",
    "Bali",
    "Jawa Timur",
    "Sumatera Utara",
    "Sulawesi Selatan"
  ].obs;

  // List of available expertises
  final expertises = [
    "Maen Basket",
    "Nguli",
    "Pemrograman",
    "Desain Grafis",
    "Manajemen Proyek"
  ].obs;

  // Toggle the expansion state of a section
  void toggleSection(String title) {
    expandedSections[title] = !(expandedSections[title] ?? false);
  }

  // Set the selected province
  void setSelectedProvince(String value) {
    selectedItems['Province'] = value;
    update(); // Notify listeners about the change
  }

  // Set the selected expertise
  void setSelectedExpertise(String value) {
    selectedItems['Expertise'] = value;
    update(); // Notify listeners about the change
  }

  // Get the selected province
  String? get selectedProvince => selectedItems['Province'];

  // Get the selected expertise
  String? get selectedExpertise => selectedItems['Expertise'];

  // Apply filters (you can extend this method based on your needs)
  void applyFilters() {
    // Implement your filter logic here
    print(
        'Applying filters: Province - ${selectedProvince}, Expertise - ${selectedExpertise}');
    // You might want to fetch filtered data from an API or filter local data
    // Then update your UI accordingly
  }

  // Reset all filters
  void resetFilters() {
    selectedItems.clear();
    update(); // Notify listeners about the change
  }

  // Add a new province to the list
  void addProvince(String province) {
    if (!provinces.contains(province)) {
      provinces.add(province);
    }
  }

  // Add a new expertise to the list
  void addExpertise(String expertise) {
    if (!expertises.contains(expertise)) {
      expertises.add(expertise);
    }
  }

  void visibleToggle() {
    // isVisible.toggle();
    isVisible.value = !isVisible.value;
    // print(isVisible.value);
  }
}
