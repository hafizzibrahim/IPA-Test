import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/custom_button.dart';
import '../controllers/organizations_controller.dart';

class OrganizationsView extends GetView<OrganizationsController> {
  OrganizationsView({super.key});

  @override
  final OrganizationsController controller = Get.put(OrganizationsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24,),
          Text(
            'Add Organization Experience',
            style: semiBoldText24,
          ),
          const SizedBox(height: 20,),
          Text(
            'Organization Name',
            style: boldText12,
          ),
          const SizedBox(height: 8,),
          CustomTextField(
            controller: controller.organizationController,
            hintText: 'Enter your organization name',
          ),
          const SizedBox(height: 20,),
          Text(
            'Position',
            style: boldText12,
          ),
          const SizedBox(height: 8,),
          CustomTextField(
            controller: controller.positionController,
            hintText: 'Enter your position',
          ),
          const SizedBox(height: 20,),
          Text(
            'Start Date',
            style: boldText12,
          ),
          const SizedBox(height: 8,),
          GestureDetector(
            onTap: () => controller.selectStartDate(context),
            child: AbsorbPointer(
              child: CustomTextField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.startDateController,
                hintText: 'Select start date',
                suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            'End Date',
            style: boldText12,
          ),
          const SizedBox(height: 8,),
          GestureDetector(
            onTap: () => controller.selectEndDate(context),
            child: AbsorbPointer(
              child: CustomTextField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.endDateController,
                hintText: 'Select end date',
                suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
              ),
            ),
          ),
          const SizedBox(height: 24,),
          CustomButton(
            text: 'Save',
            onPressed: (){},
            color: primaryBlueColor,
            radius: 10,
            width: double.infinity,
            textSize: boldText14,
          )
        ],
      ),
    );
  }
}
