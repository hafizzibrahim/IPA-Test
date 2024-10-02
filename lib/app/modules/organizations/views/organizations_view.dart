import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_card.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/custom_button.dart';
import '../controllers/organizations_controller.dart';
import '../../widget/profile_button.dart';

class OrganizationsView extends GetView<OrganizationsController> {
  OrganizationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral02Color,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                'Add Organization Experience',
                style: regulerText24,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  color: neutral01Color,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 13),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Organization Name',
                      style: boldText12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      controller: controller.organizationController,
                      hintText: 'Enter your organization name',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Position',
                      style: boldText12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      controller: controller.positionController,
                      hintText: 'Enter your position',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Start Date',
                      style: boldText12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => controller.selectStartDate(context),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: controller.startDateController,
                          hintText: 'Select start date',
                          suffixIcon: Icon(Icons.calendar_today,
                              color: primaryBlueColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'End Date',
                      style: boldText12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => controller.selectEndDate(context),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: controller.endDateController,
                          hintText: 'Select end date',
                          suffixIcon: Icon(Icons.calendar_today,
                              color: primaryBlueColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProfileButton(
                          icon: Icon(
                            Icons.save_outlined,
                            color: neutral01Color,
                          ),
                          color: primaryDarkBlueColor,
                          text: 'Save',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ProfileButton(
                          icon: Icon(
                            Icons.close,
                            color: neutral01Color,
                          ),
                          color: secondaryRedColor,
                          text: 'Cancel',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ProfileCard(
                        title: 'Bangkit Academy',
                        leftSubTitle: 'Mobile Development Cohort',
                        startDate: 'September 2024',
                        endDate: 'December 2024',
                        onTap1: () {},
                        onTap2: () {},
                        onTap3: () {}),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
