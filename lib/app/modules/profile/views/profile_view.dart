import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../controllers/profile_controller.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/custom_dropdown.dart';
import '../../widget/profile_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: primaryBlueColor,
                      radius: 18,
                      child: Icon(Icons.edit, color: neutral01Color, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            Text(
              'Identity Card',
              style: boldText12,
            ),
            const SizedBox(height: 8,),
            Obx(() => DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              padding: const EdgeInsets.all(6),
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null) {
                    controller.setIdentityCardFile(File(result.files.single.path!));
                  } else {
                    print('User canceled the picker');
                  }
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: neutral02Color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: controller.identityCardFile.value != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      controller.identityCardFile.value!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                      : const Center(
                    child: Icon(Icons.add_photo_alternate, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            )),
            const SizedBox(height: 16,),
            Text(
              'Student Card',
              style: boldText12,
            ),
            const SizedBox(height: 8,),
            Obx(() => DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              padding: const EdgeInsets.all(6),
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result != null) {
                    controller.setStudentCardFile(File(result.files.single.path!));
                  } else {
                    print('User canceled the picker');
                  }
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: neutral02Color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: controller.studentCardFile.value != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      controller.studentCardFile.value!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                      : const Center(
                    child: Icon(Icons.add_photo_alternate, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            )),
            const SizedBox(height: 24),
            Text(
              'Email',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 16),
            Text(
              'Gender',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            Obx(() => CustomDropdown(
              options: controller.genderOptions,
              selectedOption: controller.selectedGender.value,
              onSelected: (String? newGender) {
                controller.setGender(newGender);
              },
            )),
            const SizedBox(height: 16),
            Text(
              'Provincial Organization',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: controller.provincialOrgController,
              hintText: 'Enter provincial organization',
            ),
            const SizedBox(height: 16),
            Text(
              'Place of Birth',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: controller.placeOfBirthController,
              hintText: 'Enter place of birth',
            ),
            const SizedBox(height: 16),
            Text(
              'Date of Birth',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => controller.selectDate(context),
              child: AbsorbPointer(
                child: CustomTextField(
                  controller: controller.dateOfBirthController,
                  hintText: 'Select date of birth',
                  suffixIcon: Icon(Icons.calendar_today, color: primaryBlueColor),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'LinkedIn',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: controller.linkedInController,
              hintText: 'Enter LinkedIn profile URL',
            ),
            const SizedBox(height: 16),
            Text(
              'Instagram',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: controller.instagramController,
              hintText: 'Enter Instagram profile URL',
            ),
            const SizedBox(height: 16),
            Text(
              'First Expertise',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            Obx(() => CustomDropdown(
              options: controller.firstExpertise,
              selectedOption: controller.selectedFirstExpertise.value,
              onSelected: (String? newFirstExpertise) {
                controller.setFirstExpertise(newFirstExpertise);
              },
            )),
            const SizedBox(height: 16),
            Text(
              'Second Expertise',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            Obx(() => CustomDropdown(
              options: controller.secondExpertise,
              selectedOption: controller.selectedSecondExpertise.value,
              onSelected: (String? newSecondExpertise) {
                controller.setSecondExpertise(newSecondExpertise);
              },
            )),
            const SizedBox(height: 16),
            Text(
              'Address',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              maxLines: 5,
              controller: controller.addressController,
              hintText: 'Enter address',
            ),
            const SizedBox(height: 16),
            Text(
              'Residence Address',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              maxLines: 5,
              controller: controller.residenceAddressController,
              hintText: 'Enter residence address',
            ),
            const SizedBox(height: 16),
            Text(
              'Bio',
              style: boldText12,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              maxLines: 5,
              controller: controller.bioController,
              hintText: 'Enter your bio',
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileButton(
                    icon: Icon(Icons.save_outlined, color: neutral01Color,),
                    color: primaryDarkBlueColor,
                    text: 'Save',
                  ),
                ),
                ProfileButton(
                  icon: Icon(Icons.close, color: neutral01Color,),
                  color: secondaryRedColor,
                  text: 'Clear',
                )
              ],
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
