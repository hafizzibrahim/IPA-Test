import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_dropdown.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_textfield.dart';
import '../controllers/educations_controller.dart';

class EducationsView extends GetView<EducationsController> {
  EducationsView({super.key});

  @override
  final EducationsController controller = Get.put(EducationsController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Add Education History',
              style: semiBoldText24,
            ),
            const SizedBox(height: 20),
            Text(
              'Institution Name',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: controller.institutionController,
              hintText: 'Enter your Institution Name'
            ),
            const SizedBox(height: 16),
            Text(
              'Major/Field of Study',
              style: boldText12,
            ),
            CustomTextField(
              controller: controller.majorController,
              hintText: 'Enter your Major/Field Study',
            ),
            const SizedBox(height: 16,),
            Text(
              'Level',
              style: boldText12,
            ),
            const SizedBox(height: 8,),
            Obx(() => CustomDropdown(
              options: controller.levelOptions,
              selectedOption: controller.selectedLevel.value,
              onSelected: (String? newLevel) {
                controller.setLevel(newLevel);
              },
            )),
            const SizedBox(height: 16,),
            Text(
              'Graduation Date',
              style: boldText12,
            ),
            const SizedBox(height: 8,),
            GestureDetector(
              onTap: () => controller.selectDate(context),
              child: AbsorbPointer(
                child: CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.gradController,
                  hintText: 'Select your graduation date',
                  suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
                ),
              ),
            ),
            const SizedBox(height: 24,),
            CustomButton(
              text: 'Save',
              onPressed: () {},
              color: primaryBlueColor,
              radius: 10,
              width: double.infinity,
              textSize: boldText14,
            ),
          ],
        ),
      ),
    );
  }
}
