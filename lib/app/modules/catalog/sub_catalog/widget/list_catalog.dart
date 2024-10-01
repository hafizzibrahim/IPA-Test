import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/themes.dart';

class ListCatalog extends StatefulWidget {
  const ListCatalog({
    super.key,
    required this.image,
    required this.category,
    required this.company,
    required this.desc,
    required this.time,
    required this.onTap,
  });

  final String image;
  final String category;
  final String company;
  final String desc;
  final String time;
  final Function() onTap;

  @override
  State<ListCatalog> createState() => _ListCatalogState();
}

class _ListCatalogState extends State<ListCatalog> {
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: GestureDetector(
          onTap: _onTapUp,
          onTapCancel: _onTapCancel,
          onTapDown: _onTapDown,
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.image,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.category,
                          style: boldText14.copyWith(color: secondaryRedColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.company,
                          style: boldText14.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '"${widget.desc}"',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: boldText14,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.time,
                          style: regulerText12.copyWith(color: neutral03Color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: neutral03Color, thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}
