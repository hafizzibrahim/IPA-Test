import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.title,
    required this.leftSubTitle,
    this.rightSubTitle,
    this.startDate,
    this.endDate,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  });

  final String title;
  final String leftSubTitle;
  final String? rightSubTitle;
  final String? startDate;
  final String? endDate;
  final Function() onTap1;
  final Function() onTap2;
  final Function() onTap3;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: neutral02Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                title,
                style: boldText24,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '$leftSubTitle ',
                    style: regulerText12,
                  )),
              const SizedBox(
                width: 3,
              ),
              Text(
                rightSubTitle != null ? '| $rightSubTitle' : "",
              )
            ],
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '${startDate ?? ''} ',
                    style: semiBoldText12,
                  )),
              const SizedBox(
                width: 3,
              ),
              Text(
                endDate != null ? '- $endDate' : "",
                style: semiBoldText12,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: onTap1,
                    child: SvgPicture.asset('assets/icons/edit.svg')),
                const SizedBox(
                  width: 3,
                ),
                InkWell(
                    onTap: onTap2,
                    child: SvgPicture.asset('assets/icons/trashcan.svg')),
                FittedBox(
                  child: InkWell(
                    onTap: onTap3,
                    child: Icon(
                      Icons.menu,
                      color: primaryDarkBlueColor,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
        ]));
  }
}
