import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral01Color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(color: neutral03Color, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Image.asset("assets/images/maritimmuda_connect.png"),
      ),
    );
  }
}
