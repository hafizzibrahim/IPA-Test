import 'package:flutter/material.dart';

import '../../../themes.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.onTap,
  });

  final Widget icon;
  final String text;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(width: 4),
              Flexible(
                child: Text(
                  text,
                  style: regulerText10.copyWith(color: neutral01Color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}