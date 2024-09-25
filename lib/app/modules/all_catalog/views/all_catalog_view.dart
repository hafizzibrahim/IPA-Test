import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/all_catalog/widget/catalog_card.dart';
import '../controllers/all_catalog_controller.dart';

class AllCatalogView extends GetView<AllCatalogController> {
  const AllCatalogView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const CatalogCard();
      },
    );
  }
}
