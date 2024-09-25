import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class ListCatalog extends StatelessWidget {
  const ListCatalog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/catalog_image.jpeg",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    "oinevwoivoo",
                    style: boldText12.copyWith(color: secondaryRedColor),
                  ),
                  Text(
                    "Fajar Elektronik",
                    style: boldText14.copyWith(color: secondaryRedColor),
                  ),
                  Expanded(
                    child: Text(
                      '"Menyediakan peralatan-peralatan elektronik mutakhir dan terbaik"',
                      maxLines: 2,
                      style: boldText12,
                    ),
                  ),
                  Text(
                    "2 days ago",
                    style: regulerText10.copyWith(color: neutral03Color),
                  ),
                ],
              ),
            ],
          ),
          Divider(color: neutral03Color, thickness: 1),
        ],
      ),
    );
  }
}
