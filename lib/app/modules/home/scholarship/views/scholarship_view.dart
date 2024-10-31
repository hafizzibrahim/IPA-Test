import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/data/models/scholarship_data.dart';

import '../../../../../themes.dart';
import '../../../widget/program_card.dart';
import '../../../widget/searchbar_widget.dart';
import '../controllers/scholarship_controller.dart';
import 'detail_scholarship_view.dart';

class ScholarshipView extends GetView<ScholarshipController> {
  const ScholarshipView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: neutral02Color,
        appBar: AppBar(
          backgroundColor: neutral02Color,
          title: Text(
            'Scholarship List',
            style: boldText24,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(children: <Widget>[
          Container(
            color: primaryBlueColor,
            child: Padding(
              padding: EdgeInsets.all(30.0),

              child: SearchbarWidget(),
              // child: TextField(
              //
              //   decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(30.0),
              //         borderSide: BorderSide(width: 20.0, color: Colors.white),
              //       ),
              //       hintText: 'Search Event',
              //       prefixIcon: Icon(
              //         Icons.search,
              //         size: 30.0,
              //       ),
              //       suffixIcon: IconButton(
              //           icon: Icon(Icons.filter_alt_outlined),
              //           onPressed: () {
              //
              //           }
              //       )
              //
              //   ),
              // ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
            // child:Expanded(

            child: ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              // scrollDirection: Axis.vertical,
              itemCount: scholarshipList.length,
              itemBuilder: (context, index) {
                final ScholarshipData scholarship = scholarshipList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScholarshipView(
                                  scholarshipData: scholarship,
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: ProgramCard(
                      image: scholarship.imageUrl,
                      date: scholarship.date,
                      textTitle: scholarship.title,
                      textSubTitle: scholarship.description!,
                      // views: scholarship.views,
                      // likes: scholarship.likes,
                      // send: scholarship.send,
                    ),
                  ),
                );
              },
            ),
          ))
        ]));
  }
}
