import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/auth/widget/header_auth.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_button.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_textfield.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
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
                const HeaderAuth(),
                const SizedBox(height: 80),
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
                        Obx(
                          () => controller.isSuccesSend.value
                              ? Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    "We have emailed your password reset link!",
                                    style: regulerText14.copyWith(
                                      color: Colors.green[700],
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Forgot Password",
                            style: mediumText30.copyWith(
                                color: primaryDarkBlueColor),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Input email to reset your password",
                            style:
                                regulerText11.copyWith(color: neutral03Color),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: regulerText12.copyWith(
                                color: primaryDarkBlueColor),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: controller.emailC,
                          hintText: "Enter your email",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.validateEmail(value);
                          },
                          validator: controller.validateEmailField,
                          preffixIcon: Icon(Icons.email, color: neutral03Color),
                        ),
                        const SizedBox(height: 30),
                        const SizedBox(height: 35),
                        Obx(
                          () {
                            if (controller.isCheckField.value) {
                              return CustomButton(
                                text: "Send",
                                isLoading: controller.isLoading.value,
                                onPressed: () async {
                                  if (controller.validateForm()) {
                                    controller
                                        .forgotPassword(controller.emailC.text);
                                  }
                                },
                              );
                            } else {
                              return CustomButton(
                                onPressed: () {},
                                text: "Send",
                                color: neutral03Color,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: primaryDarkBlueColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
