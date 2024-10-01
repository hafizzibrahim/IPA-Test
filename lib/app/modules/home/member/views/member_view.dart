import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/home/member/views/member_detail_view.dart';
import 'package:maritimmuda_connect/app/modules/home/member/widget/filter_dropdown.dart';
import 'package:maritimmuda_connect/app/modules/widget/searchbar_widget.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../controllers/member_controller.dart';

class MemberView extends GetView<MemberController> {
  const MemberView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MemberController());

    return Scaffold(
      backgroundColor: neutral02Color,
      endDrawer: SafeArea(child: FilterDrawer()),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Column(
                children: [
                  SearchbarWidget(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 7.5),
                          color: neutral01Color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: ListTile(
                            onTap: () {
                              Get.to(() => MemberDetailView());
                            },
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.png"),
                              // child: Image(
                              //     image: AssetImage("assets/images/profile.png")),
                            ),
                            title: Text("Ilham Nur", style: regulerText24),
                            subtitle:
                                Text("Jawa timur", style: extraLightText16),
                            trailing: CircleAvatar(
                                backgroundColor: primaryDarkBlueColor,
                                maxRadius: 15,
                                child: Icon(Icons.chevron_right,
                                    color: neutral01Color)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Obx(() => AnimatedPositioned(
            //     duration: Duration(milliseconds: 300),
            //     curve: Curves.easeInOut,
            //     right: controller.isVisible.value
            //         ? -MediaQuery.of(context).size.width
            //         : 0,
            //     top: 0,
            //     bottom: 0,
            //     width: MediaQuery.of(context).size.width * 0.8,
            //     child: FilterDrawer())),
          ],
        ),
      ),
    );
  }
}
