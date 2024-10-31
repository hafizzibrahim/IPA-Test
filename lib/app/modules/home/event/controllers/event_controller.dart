import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/data/models/event_data.dart';
import 'package:maritimmuda_connect/app/data/models/response/event_response.dart';
import 'package:maritimmuda_connect/app/data/services/event_service.dart';
import 'package:maritimmuda_connect/app/modules/home/event/views/category_event.dart';
import 'package:maritimmuda_connect/app/modules/home/event/views/list_event_view.dart';

class EventController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;
  var isLoading = false.obs;
  var eventsList = <Event>[].obs;
  var searchQuery = "".obs;
  var filterEventList = <Event>[].obs;
  var sortedEventList = <Event>[].obs;

  List<String> title = [
    'All',
    'Competetion',
    'Seminar',
    'Environment Action',
    'Forum',
    'Training',
    'Community Development'
  ];

  List<Widget> screens = [
    const ListEventView(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),
    const CategoryEvent(),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 7, vsync: this);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
      sortEventsByType(getTypeForTab(selectedIndex.value));
    });
    getAllEvents();
  }

  void getAllEvents() async {
    try {
      isLoading.value = true;
      var response = await EventService().getAllEvents();
      eventsList.assignAll(response);
      filterEventList.assignAll(eventsList);
    } catch (e) {
      print("Error fetching events: $e");
    } finally {
      isLoading.value = false;
    }
  }

  int getTypeForTab(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return 4;
      case 2:
        return 1;
      case 3:
        return 8;
      case 4:
        return 3;
      case 5:
        return 7;
      case 6:
        return 5;
      default:
        return 0;
    }
  }

  void searchEvents(String query) {
    searchQuery.value = query;
    // applyFilters();


    var tempList = List<Event>.from(eventsList);

    if (searchQuery.value.isNotEmpty) {

      tempList = tempList.where((event) {
        final nameMatch = event.name?.toLowerCase()
                .contains(searchQuery.value.toLowerCase()) ??
            false;
        final organizerMatch = event.organizerName
                ?.toLowerCase()
                .contains(searchQuery.value.toLowerCase()) ??
            false;
        return nameMatch || organizerMatch;
      }).toList();
    }


    filterEventList.assignAll(tempList);
    sortedEventList.assignAll(tempList);


  }


  void sortEventsByType(int type) {
    var sortedList = eventsList.where((event) => event.type == type).toList();
    sortedEventList.assignAll(type == 0 ? eventsList : sortedList);
    // var filteredList = eventsList.where((event) => event.type == type).toList();
    // filteredList.sort((a, b) => (a.type ?? 0).compareTo(b.type ?? 0));
    // sortedEventList.assignAll(filteredList);

  }

  void setSelectedIndex(int index) {
    tabController.index = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

// final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   void increment() => count.value++;
}
