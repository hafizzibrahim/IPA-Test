import 'package:flutter/material.dart';

import '../../../themes.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  final Widget icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            icon,
            Text(
              text,
              style: regulerText10.copyWith(color: neutral01Color),
            ),
          ],
        ),
      ),
    );
  }
}
