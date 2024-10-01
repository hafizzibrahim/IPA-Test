import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/e_kta/controllers/e_kta_controller.dart';
import 'package:maritimmuda_connect/themes.dart';

class EKtaDetailView extends GetView<EKtaController> {
  const EKtaDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show QR',
            style: semiBoldText16.copyWith(color: neutral04Color)),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [primaryBlueColor, primaryDarkBlueColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 380,
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: neutral04Color.withOpacity(0.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/qrcode.png", scale: 4),
                      const SizedBox(height: 15),
                      Hero(
                        tag: 'herotag',
                        child: Text("Komeng Uhuy",
                            style:
                                regulerText20.copyWith(color: neutral01Color)),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 65,
                left: 150,
                child: Hero(
                  tag: 'test',
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/profile.png"))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
