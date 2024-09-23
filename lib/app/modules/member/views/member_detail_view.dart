import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/searchbar_widget.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../controllers/member_controller.dart';

class MemberDetailView extends GetView<MemberController> {
  const MemberDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral02Color,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 343,
                width: 403,
                decoration: BoxDecoration(
                    color: neutral01Color,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    const CircleAvatar(),
                    Text("Uzank", style: semiBoldText24),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text("Jawa Timur", style: regulerText16),
                        VerticalDivider(
                          thickness: 1,
                          width: 20,
                          color: neutral04Color,
                          indent: 10,
                          endIndent: 100,
                        ),
                        Text("Joined March 2024", style: regulerText16),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
