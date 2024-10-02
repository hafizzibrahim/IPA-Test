import 'package:flutter/material.dart';

import '../../../../themes.dart';

class CustomCardSlider extends StatelessWidget {
  const CustomCardSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // jangan bingung kalo di cardnya ada putih putih karena emg imagenya begitu
    return Hero(
      tag: 'test',
      child: Container(
        decoration: BoxDecoration(
            color: neutral02Color,
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/ekta.png"))),
      ),
    );
  }
}
