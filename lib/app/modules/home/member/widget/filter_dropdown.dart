import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/home/member/controllers/member_controller.dart';
import 'package:maritimmuda_connect/themes.dart';

class FilterDrawer extends GetView<MemberController> {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
      child: Container(
        color: primaryBlueColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Filter",
                        style: regulerText24.copyWith(color: neutral04Color)),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildDropdownSection(
                          title: 'Province',
                          icon: Icons.maps_home_work,
                          items: ["Jawa Barat", "Bali"],
                          onSelected: (value) =>
                              controller.setSelectedProvince(value),
                        ),
                        SizedBox(height: 16),
                        _buildDropdownSection(
                          title: 'Expertise',
                          icon: Icons.travel_explore_outlined,
                          items: ["Maen Basket", "Nguli"],
                          onSelected: (value) =>
                              controller.setSelectedExpertise(value),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownSection({
    required String title,
    required IconData icon,
    required List<String> items,
    required Function(String) onSelected,
  }) {
    return Obx(() {
      bool isExpanded = controller.expandedSections[title] ?? false;
      String selectedItem = controller.selectedItems[title] ?? '';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => controller.toggleSection(title),
            child: Row(
              children: [
                Icon(icon, color: neutral04Color),
                SizedBox(width: 10),
                Text(title,
                    style: regulerText16.copyWith(color: neutral04Color)),
                Spacer(),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: neutral04Color,
                ),
              ],
            ),
          ),
          if (isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map((item) => InkWell(
                        onTap: () => onSelected(item),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            item,
                            style: (item == selectedItem
                                    ? boldText14
                                    : regulerText15)
                                .copyWith(color: neutral04Color),
                          ),
                        ),
                      ))
                  .toList(),
            ),
        ],
      );
    });
  }
}
