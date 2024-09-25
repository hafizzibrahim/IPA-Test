import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/sub_catalog/widget/list_catalog.dart';
import '../controllers/sub_catalog_controller.dart';

class SubCatalogView extends GetView<SubCatalogController> {
  const SubCatalogView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ListCatalog();
      },
    );
  }
}
