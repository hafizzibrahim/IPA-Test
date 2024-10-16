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
    this.gradient,
  });

  final String text;
  final void Function() onPressed;
  final Color? color;
  final double? radius;
  final double? width;
  final double? height;
  final TextStyle? textSize;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: color ?? primaryBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          elevation: 5,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          child: Container(
            constraints:
                const BoxConstraints(minWidth: double.infinity, minHeight: 55),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                text,
                style: textSize ?? boldText20.copyWith(color: neutral01Color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
