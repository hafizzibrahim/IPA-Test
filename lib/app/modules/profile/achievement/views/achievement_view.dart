import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_textfield.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_button.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_card.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../../../widget/custom_dialog.dart';
import '../../../widget/custom_snackbar.dart';
import '../controllers/achievement_controller.dart';


class AchievementView extends GetView<AchievementController> {
  const AchievementView({super.key});

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
                child: Text('Add Achievement History',
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
                        Text('Award/accomplishment', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Enter award name',
                          controller: controller.awardC,
                        ),
                        const SizedBox(height: 16),
                        Text('Appreciator/Organizer', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Enter appreciator name',
                          controller: controller.appreciatorC,
                        ),
                        const SizedBox(height: 16),
                        Text('Event Name', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Enter event name',
                          controller: controller.eventNameC,
                        ),
                        const SizedBox(height: 16),
                        Text('Event Level', style: boldText12,),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Enter event level',
                          controller: controller.eventLevelC,
                        ),
                        const SizedBox(height: 16),
                         Text('Date of Achievement', style: boldText12,),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => controller.selectDate(context),
                          child: AbsorbPointer(
                            child: CustomTextField(
                              controller: controller.dateC,
                              hintText: 'Select date of achievement',
                              suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProfileButton(
                                icon: Icon(
                                  Icons.save_outlined,
                                  color: neutral01Color,
                                ),
                                text: 'Save',
                                onTap: controller.saveAchievement,
                                color: primaryDarkBlueColor),
                            const SizedBox(width: 10),
                            ProfileButton(
                                icon: Icon(
                                  Icons.close,
                                  color: neutral01Color,
                                ),
                                color: secondaryRedColor,
                                text: 'Clear',
                                onTap: () {
                                  showCustomDialog(
                                      content: 'Are you sure you want to clear all data entered?',
                                      onConfirm: () {
                                        controller.clearAll();
                                        Get.back();
                                        customSnackbar(
                                          'All data has been deleted successfully',
                                        );
                                      },
                                      onCancel: (){
                                        Get.back();
                                      });
                                }
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Obx(() => Column(
                          children: controller.achievement.asMap().entries.map((entry) {
                            int idx = entry.key;
                            Achievements exp = entry.value;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ProfileCard(
                                title: exp.award,
                                leftSubTitle: exp.appreciatior,
                                rightSubTitle: exp.eventName,
                                startDate: exp.eventLevel,
                                endDate: exp.date,
                                onTap1: () {},
                                onTap2: () => controller.deleteAchievement(idx),
                                onTap3: () {},
                              ),
                            );
                          }).toList(),
                        )),
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
