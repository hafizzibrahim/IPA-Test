import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/data/models/category_data.dart';
import 'package:maritimmuda_connect/app/modules/event/views/event_view.dart';
import 'package:maritimmuda_connect/app/modules/job/views/job_view.dart';
import 'package:maritimmuda_connect/app/modules/auth/login/views/login_view.dart';

import 'package:maritimmuda_connect/app/modules/scholarship/views/scholarship_view.dart';
import 'package:maritimmuda_connect/app/modules/catalog/views/catalog_view.dart';
import 'package:maritimmuda_connect/app/modules/home/widget/home_card.dart';

import 'package:maritimmuda_connect/app/modules/home/member/views/member_view.dart';


import '../controllers/home_controller.dart';
import 'package:maritimmuda_connect/themes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> listImage = [
      "assets/images/eventimage.png",
      "assets/images/eventimage.png",
      "assets/images/eventimage.png",
      "assets/images/eventimage.png",
    ];

    return Scaffold(
      backgroundColor: neutral02Color,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/logo_maritim_muda_connect.png"),
                    SizedBox(
                      width: 16,
                    ),
                    Image.asset("assets/images/logo_maritim.png"),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    color: neutral01Color,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: neutral04Color.withOpacity(0.3), // Warna shadow
                        spreadRadius: 1, // Penyebaran shadow
                        blurRadius: 5, // Tingkat blur shadow
                        offset: Offset(3, 3), // Arah dan jarak shadow (x, y)
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: regulerText16.copyWith(
                                color: neutral04Color, fontSize: 20),
                          ),
                          Text(
                            "Komeng",
                            style: semiBoldText24.copyWith(
                                color: primaryBlueColor),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "No: 0900240850",
                                style: regulerText10.copyWith(fontSize: 9),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "No: 0900240850",
                                style: regulerText10.copyWith(fontSize: 9),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 50, // Ukuran lingkaran
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true, // Otomatis bergeser
                enlargeCenterPage: true, // Gambar di tengah diperbesar
              ),
              items: listImage.map((item) {
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      item, // Mengambil path dari listImage
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Center(
            child: Wrap(
              spacing: 16, // Jarak horizontal antar card
              runSpacing: 24, // Jarak vertikal antar card
              alignment: WrapAlignment.start,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) -
                      24, // Lebar HomeCard
                  child: HomeCard(
                    icon: 'assets/icons/member_icon.svg',
                    title: 'Member',
                    onTap: () {
                      Get.to(() => MemberView());
                    },
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) -
                      24, // Lebar HomeCard
                  child: HomeCard(
                    icon: 'assets/icons/event_icon.svg',
                    title: 'Event',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventView(categoryList)));
                    },
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) -
                      24, // Lebar HomeCard
                  child: HomeCard(
                    icon: 'assets/icons/scholarship_icon.svg',
                    title: 'Scholarship',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScholarshipView()));

//                       Get.to(ScholarshipView());
                    },
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 2) -
                      24,
                  child: HomeCard(
                    icon: 'assets/icons/job_icon.svg',
                    title: 'Jobs',
                    onTap: () {

                      Get.to(() => JobView());

                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
