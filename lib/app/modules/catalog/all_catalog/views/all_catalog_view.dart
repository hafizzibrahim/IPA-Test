import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/catalog/all_catalog/widget/catalog_card.dart';
import '../controllers/all_catalog_controller.dart';

class AllCatalogView extends GetView<AllCatalogController> {
  const AllCatalogView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 160),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return CatalogCard(
            onTap: () {},
            company: "Fajar Elektronik",
            image: "assets/images/catalog_image.jpeg",
            desc:
                "Menyediakan peralatan-peralatan elektronik mutakhir dan terbaik",
            time: "2 days ago",
          );
        },
      ),
    );
  }
}
