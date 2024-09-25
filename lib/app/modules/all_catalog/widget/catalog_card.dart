import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: neutral01Color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryDarkBlueColor),
                  ),
                  child: Text(
                    "Fajar Elektronik",
                    style: boldText12.copyWith(color: primaryDarkBlueColor),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/catalog_image.jpeg",
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Menyediakan peralatan-peralatan elektronik mutakhir dan terbaik",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: semiBoldText12,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_sharp,
                        color: primaryDarkBlueColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "2 days ago",
                        style: regulerText10.copyWith(color: neutral03Color),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
