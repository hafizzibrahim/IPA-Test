import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({
    super.key,
    this.title1,
    this.title2,
    this.subTitle1,
    this.subTitle2,
    this.icon1,
    this.icon2,
  });

  final String? title1;
  final List<String>? subTitle1;
  final String? title2;
  final List<String>? subTitle2;
  final Widget? icon1;
  final Widget? icon2;

  @override
  _FilterDropdownState createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String selected1 = '';
  String selected2 = '';
  bool isExpanded1 = false;
  bool isExpanded2 = false;

  void toggleDropdown1() {
    setState(() {
      isExpanded1 = !isExpanded1;
    });
  }

  void toggleDropdown2() {
    setState(() {
      isExpanded2 = !isExpanded2;
    });
  }

  void selectProvince(String province) {
    setState(() {
      selected1 = province;
      isExpanded1 = false;
    });
  }

  void selectExpertise(String expertise) {
    setState(() {
      selected2 = expertise;
      isExpanded2 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: primaryBlueColor.withOpacity(0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildDropdownItem(
            widget.title1 ?? 'Province',
            isExpanded1,
            toggleDropdown1,
            widget.subTitle1 ?? ["Jawa Barat", "Bali"],
            widget.icon1 ?? const Icon(Icons.maps_home_work),
            (value) => selectProvince(value),
            selected1,
          ),
          const SizedBox(height: 16),
          _buildDropdownItem(
            widget.title2 ?? 'Expertise',
            isExpanded2,
            toggleDropdown2,
            widget.subTitle2 ?? ["Maen Basket", "Nguli"],
            widget.icon2 ?? const Icon(Icons.travel_explore_outlined),
            (value) => selectExpertise(value),
            selected2,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownItem(
    String title,
    bool isExpanded,
    VoidCallback onToggle,
    List<String> subItems,
    Widget icon,
    ValueChanged<String> onItemSelected,
    String selectedItem,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(title, style: regulerText16),
            const SizedBox(width: 130),
            IconButton(
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined,
              ),
              onPressed: onToggle,
            ),
          ],
        ),
        if (isExpanded)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subItems
                .map(
                  (subItem) => InkWell(
                    onTap: () => onItemSelected(subItem),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        subItem,
                        style: subItem == selectedItem
                            ? boldText14
                            : regulerText15.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
