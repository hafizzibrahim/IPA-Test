import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/program_card.dart';
import '../controllers/home_controller.dart';
import 'package:maritimmuda_connect/themes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral02Color,
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgramCard(
              image: "assets/images/eventimage.png",
              date: "21 agustus",
              textTitle: "Kick Off Meeting Penyusunan RKP Tahun 2024",
              textSubTitle:
                  "Kick Off Meeting Penyusunan RKP Tahun 2024 dengan tema Mempercepat Transformasi Ekonomi yang Inklusif dan Berkelanjutan........",
            ),
          ],
        ),
      ),
    );
  }
}
