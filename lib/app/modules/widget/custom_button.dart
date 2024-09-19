import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: neutral01Color,
          backgroundColor: primaryBlueColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
        child: Text(
          text,
          style: boldText20,
        ),
      ),
    );
  }
}
