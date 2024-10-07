import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/analytics/widget/analytic_card.dart';
import 'package:maritimmuda_connect/themes.dart';
import '../controllers/analytics_controller.dart';
import '../widget/chart_bar.dart';

class AnalyticsView extends GetView<AnalyticsController> {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral02Color,
      body: SingleChildScrollView(
        child: Column(
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
                      const SizedBox(height: 16),
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
                          Obx(() {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: primaryDarkBlueColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: controller.selectedMonth.value,
                                  items: controller.months.map((String month) {
                                    return DropdownMenuItem<String>(
                                      value: month,
                                      child: Text(
                                        month,
                                        style: regulerText12.copyWith(
                                            color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      controller.selectedMonth.value = newValue;
                                    }
                                  },
                                  dropdownColor: primaryDarkBlueColor,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                  style: regulerText12.copyWith(
                                      color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 16,
                                ),
                              ),
                            );
                          }),
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
                          const SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '',
                            height: 128,
                            color: primaryBlueColor,
                            month: 'Feb',
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '456',
                            height: 240,
                            color: primaryDarkBlueColor,
                            month: 'Mar',
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '',
                            height: 160,
                            color: primaryBlueColor,
                            month: 'Apr',
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ChartBar(
                            value: '',
                            height: 128,
                            color: primaryBlueColor,
                            month: 'May',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TabBar(
              physics: const BouncingScrollPhysics(),
              controller: controller.tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: semiBoldText11.copyWith(color: neutral01Color),
              indicator: BoxDecoration(
                border: Border.all(color: Colors.transparent),
              ),
              tabs: List.generate(controller.title.length, (index) {
                return Obx(() {
                  bool isSelected = controller.selectedIndex.value == index;
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: isSelected ? primaryDarkBlueColor : neutral01Color,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Tab(
                      child: Text(
                        controller.title[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                });
              }),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 500,
              child: TabBarView(
                physics: const PageScrollPhysics(),
                controller: controller.tabController,
                children: List.generate(controller.title.length, (index) {
                  final tabData = controller.tabCardsData[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.titleMenu[index],
                          style: boldText20.copyWith(color: neutral04Color),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: GridView.builder(
                            padding: const EdgeInsets.only(top: 16),
                            itemCount: tabData.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (context, cardIndex) {
                              final card = tabData[cardIndex];
                              return AnalyticCard(
                                title: card['title'],
                                icon: card['icon'],
                                image: card['image'],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
