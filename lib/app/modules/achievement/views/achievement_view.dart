import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_button.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_textfield.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_button.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_card.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../controllers/achievement_controller.dart';

class AchievementView extends GetView<AchievementController> {
  const AchievementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral02Color,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text('Add Achievement History',
                    style: mediumText28.copyWith(fontSize: 24)),
              ),
              const SizedBox(height: 30),
              Container(
                  decoration: BoxDecoration(
                      color: neutral01Color,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 13),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Award/accomplishment'),
                          ),
                        ),
                        CustomTextField(
                          controller: controller.awardC,
                        ),
                        const SizedBox(height: 18),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Appreciator/Organizer'),
                          ),
                        ),
                        CustomTextField(
                          controller: controller.appreciatorC,
                        ),
                        const SizedBox(height: 18),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Event Name'),
                          ),
                        ),
                        CustomTextField(
                          controller: controller.eventNameC,
                        ),
                        const SizedBox(height: 18),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Event Level'),
                          ),
                        ),
                        CustomTextField(
                          controller: controller.eventLevelC,
                        ),
                        const SizedBox(height: 18),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text('Date of Achievement'),
                          ),
                        ),
                        CustomTextField(
                          readOnly: true,
                          controller: controller.dateC,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProfileButton(
                                icon: Icon(
                                  Icons.save_outlined,
                                  color: neutral01Color,
                                ),
                                text: 'Save',
                                color: primaryDarkBlueColor),
                            const SizedBox(width: 10),
                            ProfileButton(
                                icon: Icon(Icons.close, color: neutral01Color),
                                text: 'Cancel',
                                color: secondaryRedColor),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ProfileCard(
                            title: 'Mobile Apps',
                            leftSubTitle: 'Finalist',
                            onTap1: () {},
                            onTap2: () {},
                            onTap3: () {}),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 50,
              )
            ],
          )),
    );
  }
}
