import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class CustomFilter extends StatelessWidget {
  const CustomFilter({
    super.key,
    required this.filterText,
    required this.onTap,
  });

  final List<String>? filterText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: neutral01Color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: primaryDarkBlueColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Text("Urutkan Berdasarkan", style: mediumText12),
          ),
          Divider(color: neutral03Color, thickness: 1),
          Wrap(
            children: filterText!.map((text) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        text,
                        style:
                            regulerText12.copyWith(color: primaryDarkBlueColor),
                      ),
                    ),
                  ),
                  Divider(color: neutral03Color, thickness: 1),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
