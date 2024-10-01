import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/home/member/views/member_view.dart';

import '../../../themes.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard(
      {super.key,
      required this.image,
      required this.date,
      required this.textTitle,
      required this.textSubTitle});

  final String image;
  final String date;
  final String textTitle;
  final String textSubTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MemberView());
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 1,
        child: Container(
          width: 378,
          decoration: BoxDecoration(
              color: neutral01Color, borderRadius: BorderRadius.circular(15)),
          padding:
              const EdgeInsets.only(left: 23, top: 19, right: 23, bottom: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              const SizedBox(height: 10),
              Text(textTitle, style: boldText12),
              const SizedBox(height: 5),
              Opacity(
                opacity: 0.76,
                child: Text(
                  textSubTitle,
                  style: regulerText8.copyWith(color: neutral04Color),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: primaryDarkBlueColor),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: regulerText10,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye_sharp,
                          color: primaryDarkBlueColor),
                      const SizedBox(width: 4),
                      Text(
                        "2100",
                        style: regulerText10,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite, color: primaryDarkBlueColor),
                      const SizedBox(width: 4),
                      Text(
                        "79",
                        style: regulerText10,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.send, color: primaryDarkBlueColor),
                      const SizedBox(width: 4),
                      Text(
                        "3",
                        style: regulerText10,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
