import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class CatalogCard extends StatefulWidget {
  const CatalogCard({
    super.key,
    required this.company,
    required this.image,
    required this.desc,
    required this.time,
    required this.onTap,
  });

  final String company;
  final String image;
  final String desc;
  final String time;
  final Function() onTap;

  @override
  State<CatalogCard> createState() => _CatalogCardState();
}

class _CatalogCardState extends State<CatalogCard> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp() {
    setState(() {
      _isPressed = false;
    });
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isPressed ? 0.95 : 1.0,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: _onTapUp,
        onTapCancel: _onTapCancel,
        onTapDown: _onTapDown,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: neutral01Color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryDarkBlueColor),
                      ),
                      child: Text(
                        widget.company,
                        style: boldText12.copyWith(color: primaryDarkBlueColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.image,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: semiBoldText12,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_sharp,
                            color: primaryDarkBlueColor,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.time,
                            style:
                                regulerText10.copyWith(color: neutral03Color),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
