import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maritimmuda_connect/themes.dart';

class AnalyticCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String image;
  const AnalyticCard({super.key, required this.title, required this.icon, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: neutral01Color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon as IconData?),
              Text(title, style: regulerText10.copyWith(color: neutral04Color),),
            ],
          ),
          SizedBox(height: 16,),
          SvgPicture.asset(image)
        ],
      ),
    );
  }
}
