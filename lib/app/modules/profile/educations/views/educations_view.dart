import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_dropdown.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_card.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../../../widget/custom_dialog.dart';
import '../../../widget/custom_textfield.dart';
import '../../../widget/profile_button.dart';
import '../controllers/educations_controller.dart';

class EducationsView extends GetView<EducationsController> {
  const EducationsView({super.key});

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
              child: Text(
                'Add Education History',
                  style: regulerText24
              ),
            ),
            const SizedBox(height: 16),
            // Form widget wrapping the input fields
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
                      'Institution Name',
                      style: boldText12,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                        controller: controller.institutionController,
                        hintText: 'Enter your Institution Name'),
                    const SizedBox(height: 16),
                    Text(
                      'Major/Field of Study',
                      style: boldText12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      controller: controller.majorController,
                      hintText: 'Enter your Major/Field Study',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Level',
                      style: boldText12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomDropdown(
                          hintText: 'Choose your education level',
                          options: controller.levelOptions,
                          selectedOption: controller.selectedLevel.value,
                          onSelected: (String? newLevel) {
                            controller.setLevel(newLevel);
                          },
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Graduation Date',
                      style: boldText12,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => controller.selectDate(context),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: controller.gradController,
                          hintText: 'Select your graduation date',
                          suffixIcon: Icon(Icons.calendar_today,
                              color: primaryBlueColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
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
                            text: 'Clear',
                            onTap: () {
                              showCustomDialog(
                                  content: 'Are you sure you want to clear all data entered?',
                                  onConfirm: () {
                                    controller.clearAll();
                                    Get.back();
                                    Get.snackbar(
                                        'Cleared',
                                        'All data has been deleted successfully',
                                        snackPosition: SnackPosition.BOTTOM
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
                    ProfileCard(
                        title: 'Universitas Indonesia',
                        leftSubTitle: 'Ilmu Komputer',
                        rightSubTitle: 'August 2025',
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
