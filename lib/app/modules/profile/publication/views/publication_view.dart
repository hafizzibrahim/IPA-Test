import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/profile/publication/controllers/publication_controller.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_textfield.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_button.dart';
import 'package:maritimmuda_connect/app/modules/widget/profile_card.dart';
import 'package:maritimmuda_connect/themes.dart';

class PublicationView extends GetView<PublicationController> {
  const PublicationView({super.key});

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
              padding: const EdgeInsets.only(left: 15),
              child: Text('Add Publications', style: regulerText24),
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
                    Text('Title', style: boldText12),
                    const SizedBox(height: 8),
                    CustomTextField(controller: controller.titleC),
                    const SizedBox(height: 16),
                    Text('Author(s)', style: boldText12),
                    const SizedBox(height: 8),
                    CustomTextField(controller: controller.authorC),
                    const SizedBox(height: 16),
                    Text('Publication Type', style: boldText12),
                    const SizedBox(height: 8),
                    CustomTextField(controller: controller.pubTypeC, readOnly: true),
                    const SizedBox(height: 16),
                    Text('Publisher', style: boldText12),
                    const SizedBox(height: 8),
                    CustomTextField(controller: controller.publisherC),
                    const SizedBox(height: 16),
                    Text('Date of Publication', style: boldText12),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => controller.selectDate(context),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: controller.dateC,
                          hintText: 'Select date of publication',
                          suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Title Page', style: boldText12),
                    const SizedBox(height: 8),
                    Obx(() => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: neutral02Color,
                        border: Border.all(color: neutral04Color),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () => controller.pickFile(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: neutral03Color,
                                  border: Border.all(color: neutral02Color),
                                ),
                                child: Text(
                                  'Choose File',
                                  style: regulerText12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              controller.selectedFileName.value,
                              style: regulerText12,
                            ),
                          ),
                        ],
                      ),
                    )),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProfileButton(
                          icon: Icon(Icons.save_outlined, color: neutral01Color),
                          text: 'Save',
                          color: primaryDarkBlueColor,
                        ),
                        const SizedBox(width: 10),
                        ProfileButton(
                          icon: Icon(Icons.close, color: neutral01Color),
                          text: 'Cancel',
                          color: secondaryRedColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ProfileCard(
                      title: 'Mobile Apps',
                      leftSubTitle: 'Finalist',
                      onTap1: () {},
                      onTap2: () {},
                      onTap3: () {},
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
