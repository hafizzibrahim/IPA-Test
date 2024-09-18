import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/login/views/login_view.dart';

import '../controllers/home_controller.dart';
import 'package:maritimmuda_connect/themes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: regulerText10.copyWith(color: primaryDarkBlueColor),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginView());
                },
                child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
