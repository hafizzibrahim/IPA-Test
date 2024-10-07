import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/catalog/all_catalog/views/all_catalog_view.dart';
import 'package:maritimmuda_connect/app/modules/catalog/sub_catalog/views/sub_catalog_view.dart';

class CatalogController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;

  List<String> title = [
    'All',
    'Electronics',
    'Food',
    'Clothes',
    'Furniture',
  ];

  List<Widget> screens = [
    const AllCatalogView(),
    const SubCatalogView(),
    const SubCatalogView(),
    const SubCatalogView(),
    const SubCatalogView(),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
  }

  void setSelectedIndex(int index) {
    tabController.index = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
