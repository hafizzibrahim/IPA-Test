import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/login/bindings/login_binding.dart';
import 'package:maritimmuda_connect/app/modules/login/views/login_view.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_button.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_dropdown.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_textfield.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutral02Color,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: neutral01Color,
                    border: Border.all(color: neutral03Color, width: 1),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Image.asset("assets/images/maritimmuda_connect.png"),
                  ),
                ),
                const SizedBox(height: 55),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    color: neutral01Color,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: neutral03Color, width: 1),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Register",
                            style: mediumText30,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter a few details below",
                            style:
                                regulerText10.copyWith(color: neutral03Color),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Name"),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.nameC,
                          hintText: "Name",
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            controller.validateName(value);
                          },
                          validator: controller.validateNameField,
                          preffixIcon: Icon(Icons.person_outline_sharp,
                              color: neutral03Color),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email"),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.emailC,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.validateEmail(value);
                          },
                          validator: controller.validateEmailField,
                          preffixIcon:
                              Icon(Icons.email_outlined, color: neutral03Color),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Gender"),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => CustomDropdown(
                            options: controller.genderOptions,
                            selectedOption:
                                controller.selectedGender.value ?? "",
                            onSelected: (String? value) {
                              controller.setSelectedGender(value);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Province"),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => CustomDropdown(
                            options: controller.provinceOptions,
                            selectedOption:
                                controller.selectedProvince.value ?? "",
                            onSelected: (String? value) {
                              controller.setSelectedProvince(value);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Password"),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => CustomTextField(
                            controller: controller.passwordC,
                            hintText: "Password",
                            keyboardType: TextInputType.text,
                            obscureText: controller.obscureText.value,
                            onChanged: (value) {
                              controller.validatePassword(value);
                            },
                            validator: controller.validatePasswordField,
                            preffixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: neutral03Color,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.toggleObscureText();
                              },
                              icon: Icon(
                                controller.obscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: neutral03Color,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Confirm Password"),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => CustomTextField(
                            controller: controller.confirmPassC,
                            hintText: "Confirm Password",
                            keyboardType: TextInputType.text,
                            obscureText: controller.obscureText.value,
                            onChanged: (value) {
                              controller.validateConfirmPass(value);
                            },
                            validator: controller.validateConfirmPassField,
                            preffixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: neutral03Color,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.toggleObscureText();
                              },
                              icon: Icon(
                                controller.obscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: neutral03Color,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          onPressed: () {
                            if (controller.validateForm()) {
                              Get.offAll(
                                () => const LoginView(),
                                binding: LoginBinding(),
                                transition: Transition.leftToRight,
                                duration: const Duration(milliseconds: 1000),
                              );
                            }
                          },
                          text: "Register",
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Get.offAll(
                              () => const LoginView(),
                              binding: LoginBinding(),
                              transition: Transition.leftToRight,
                              duration: const Duration(milliseconds: 100),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: regulerText10,
                              ),
                              Text(
                                "Login",
                                style: regulerText10.copyWith(
                                    color: primaryBlueColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
