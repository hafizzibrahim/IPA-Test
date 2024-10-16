import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import 'package:maritimmuda_connect/app/modules/auth/forgot_password/views/forgot_password_view.dart';
import 'package:maritimmuda_connect/app/modules/navbar/bindings/main_binding.dart';
import 'package:maritimmuda_connect/app/modules/navbar/views/main_view.dart';
import 'package:maritimmuda_connect/app/modules/auth/register/bindings/register_binding.dart';
import 'package:maritimmuda_connect/app/modules/auth/register/views/register_view.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_textfield.dart';
import 'package:maritimmuda_connect/app/modules/widget/custom_button.dart';
import 'package:maritimmuda_connect/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    border: Border.all(color: neutral03Color, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Image.asset("assets/images/maritimmuda_connect.png"),
                  ),
                ),
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hi, Welcome!",
                            style: mediumText30,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter your email and password to login",
                            style:
                                regulerText10.copyWith(color: neutral03Color),
                          ),
                        ),
                        const SizedBox(height: 50),
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
                        const SizedBox(height: 30),
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
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => const ForgotPasswordView(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 100),
                                binding: ForgotPasswordBinding(),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: regulerText12.copyWith(
                                  color: primaryBlueColor),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Obx(
                          () {
                            if (controller.isCheckField.value) {
                              return CustomButton(
                                onPressed: () async {
                                  if (controller.validateForm()) {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    // await prefs.setBool("loggedIn", true);
                                    Get.offAll(
                                      () => const MainView(),
                                      binding: MainBinding(),
                                      transition: Transition.rightToLeft,
                                      duration:
                                          const Duration(milliseconds: 100),
                                    );
                                  }
                                },
                                text: "Login",
                              );
                            } else {
                              return CustomButton(
                                onPressed: () {},
                                text: "Login",
                                color: neutral03Color,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => const RegisterView(),
                              binding: RegisterBinding(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 300),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: regulerText10,
                              ),
                              Text(
                                "Register",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
