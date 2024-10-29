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
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (controller.memberList.isEmpty) {
                      return Text(
                        'Data belum tersedia',
                        style: extraLightText16,
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: controller.memberList.length,
                          itemBuilder: (context, index) {
                            final memberList = controller.memberList[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 7.5),
                              color: neutral01Color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: ListTile(
                                onTap: () {
                                  Get.to(() =>
                                      MemberDetailView(memberList: memberList));
                                },
                                leading: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/images/profile.png"),
                                  // child: Image(
                                  //     image: AssetImage("assets/images/profile.png")),
                                ),
                                title: Text(
                                  memberList.name ?? "",
                                  style: regulerText24,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
