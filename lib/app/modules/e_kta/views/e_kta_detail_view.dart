import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/e_kta/controllers/e_kta_controller.dart';
import 'package:maritimmuda_connect/themes.dart';

class EKtaDetailView extends GetView<EKtaController> {
  const EKtaDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Column(
              children: [
                Text("Hello,",
                    style: regulerText20.copyWith(color: neutral01Color)),
                Text("Komeng Uhuy",
                    style: semiBoldText24.copyWith(color: neutral01Color))
              ],
            )
          ],
        ),
      )),
    );
  }
}
