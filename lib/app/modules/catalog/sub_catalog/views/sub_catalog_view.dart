import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/catalog/sub_catalog/widget/list_catalog.dart';
import '../controllers/sub_catalog_controller.dart';

class SubCatalogView extends GetView<SubCatalogController> {
  const SubCatalogView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 150),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListCatalog(
            onTap: () {},
            image: "assets/images/catalog_image.jpeg",
            category: "Electronics",
            company: "Fajar Elektronik",
            desc:
                "Menyediakan peralatan-peralatan elektronik mutakhir dan terbaik",
            time: "2 days ago",
          );
        },
      ),
    );
  }
}
