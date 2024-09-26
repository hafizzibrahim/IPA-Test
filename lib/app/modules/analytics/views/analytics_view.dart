import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/analytics/widget/analytic_card.dart';
import 'package:maritimmuda_connect/app/modules/analytics/widget/chart_bar.dart';
import 'package:maritimmuda_connect/app/modules/analytics/widget/menu_bar_widget.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../controllers/analytics_controller.dart';

class AnalyticsView extends GetView<AnalyticsController> {
  const AnalyticsView({super.key});
  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> cardsData = [
      {
        'title': 'Member Growth',
        'icon': Icons.rocket_launch,
        'image': 'assets/images/chart.svg',
      },
      {
        'title': 'Various Member',
        'icon': Icons.bar_chart,
        'image': 'assets/images/chart.svg',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: primaryBlueColor.withOpacity(0.3),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Total of All Members: ',
                        style: regulerText16.copyWith(color: neutral04Color),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '32.110 ',
                            style: boldText20.copyWith(color: neutral04Color),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: primaryDarkBlueColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Month',
                                    style: regulerText12.copyWith(
                                        color: neutral01Color),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: neutral01Color,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChartBar(
                            value: '',
                            height: 80,
                            color: primaryBlueColor,
                            month: 'Jan',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '',
                            height: 128,
                            color: primaryBlueColor,
                            month: 'Feb',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '456',
                            height: 240,
                            color: primaryDarkBlueColor,
                            month: 'Mar',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '',
                            height: 160,
                            color: primaryBlueColor,
                            month: 'Apr',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '',
                            height: 128,
                            color: primaryBlueColor,
                            month: 'May',
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menuBar(),
                  SizedBox(height: 16,),
                  Text('About Growth', style: semiBoldText22.copyWith(color: neutral04Color),),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(), // Nonaktifkan scrolling di GridView
                    shrinkWrap: true, // Mengatur agar GridView menyesuaikan dengan tinggi
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Jumlah kolom
                      childAspectRatio: 1, // Rasio lebar dan tinggi untuk kartu
                      crossAxisSpacing: 16, // Jarak horizontal antar kartu
                      mainAxisSpacing: 16, // Jarak vertikal antar kartu
                    ),
                    itemCount: 2, // Jumlah kartu
                    itemBuilder: (context, index) {
                      return AnalyticCard(
                        title: cardsData[index]['title'],
                        icon: cardsData[index]['icon'],
                        image: cardsData[index]['image'],
                      );
                    },
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget menuBar() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MenuBarWidget(
            menu: 'Member',
          ),
          SizedBox(
            width: 8,
          ),
          MenuBarWidget(
            menu: 'Event',
            isSelected: true,
          ),
          SizedBox(
            width: 8,
          ),
          MenuBarWidget(
            menu: 'Scholarship',
          ),
          SizedBox(
            width: 8,
          ),
          MenuBarWidget(
            menu: 'Job',
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
