import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelected,
  });

  final List<String> options;
  final String selectedOption;
  final Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral02Color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownMenu(
        initialSelection: selectedOption,
        dropdownMenuEntries: options.map((String value) {
          return DropdownMenuEntry(
            value: value,
            label: value,
          );
        }).toList(),
        onSelected: onSelected,
        textStyle: regulerText12,
        width: 340,
        menuStyle: MenuStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor:
              WidgetStateProperty.resolveWith((states) => neutral02Color),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: neutral03Color,
              width: 1,
            ),
          ),
          constraints: const BoxConstraints(maxHeight: 50),
        ),
      ),
    );
  }
}
