import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../../../widget/custom_textfield.dart';
import '../controllers/organizations_controller.dart';
import '../../../widget/profile_button.dart';

class OrganizationsView extends GetView<OrganizationsController> {
  const OrganizationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            'Add Organization Experience',
            style: semiBoldText24,
          ),
          const SizedBox(
            height: 20,
          ),
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
            height: 20,
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
            height: 20,
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
                suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
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
                suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProfileButton(
                  icon: Icon(
                    Icons.save_outlined,
                    color: neutral01Color,
                  ),
                  color: primaryDarkBlueColor,
                  text: 'Save',
                ),
              ),
              ProfileButton(
                icon: Icon(
                  Icons.close,
                  color: neutral01Color,
                ),
                color: secondaryRedColor,
                text: 'Clear',
              )
            ],
          ),
        ],
      ),
    );
  }
}
