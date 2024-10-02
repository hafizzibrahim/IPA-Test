import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/social_activity/controllers/social_activity_controller.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_textfield.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_button.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_card.dart';
import 'package:maritimmuda_connect/themes.dart';



class SocialActivityView extends GetView<SocialActivityController> {
  const SocialActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: neutral02Color,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text('Add Social Activity',
                    style: regulerText24),
              ),
              const SizedBox(height: 16),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Program Name', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: controller.awardC,
                        ),
                        const SizedBox(height: 16),
                        Text('Institution Name', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: controller.appreciatorC,
                        ),
                        const SizedBox(height: 16),
                        Text('Role', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: controller.eventNameC,
                        ),
                        const SizedBox(height: 16),
                        Text('Start Date', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: controller.eventLevelC,
                        ),
                        const SizedBox(height: 16),
                        Text('End Date', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          readOnly: true,
                          controller: controller.dateC,
                        ),
                        const SizedBox(height: 15),
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
