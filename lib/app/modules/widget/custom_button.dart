import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.radius,
    this.width,
    this.height,
    this.textSize,
  });

  final String text;
  final void Function() onPressed;
  final Color? color;
  final double? radius;
  final double? width;
  final double? height;
  final TextStyle? textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: neutral01Color,
          backgroundColor: color ?? primaryBlueColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          elevation: 5,
        ),
        child: Text(
          text,
          style: textSize ?? boldText20,
        ),
      ),
    );
  }
}
