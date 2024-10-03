import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maritimmuda_connect/app/modules/widget/searchbar_widget.dart';
import 'package:maritimmuda_connect/themes.dart';

import '../../../data/models/category_data.dart';
import '../../../data/models/event_data.dart';
import '../../widget/program_card.dart';
import '../controllers/event_controller.dart';
import 'detail_event_view.dart';

class EventView extends GetView<EventController> {
  final CategoryData category;

  const EventView(this.category, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral02Color,
        body: Column(
            children: <Widget>[


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

              // 2. Category
              SizedBox(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.category.length,
                    itemBuilder: (context, index) {
                      final textCategory = category.category[index];
                      return Padding(
                          padding:  EdgeInsets.symmetric( vertical: 15.0, horizontal: 10.0),
                          child:
                          SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side:  BorderSide(color: Color(0xFF086C9E))
                                ),

                                backgroundColor: Colors.white, // Set background color
                              ),

                              onPressed: () {
                                // Action when button is pressed
                              },
                              child: Text(textCategory, style: regulerText16,),
                            ),
                          )

                      );
                    }

                ),
              ),

              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0,bottom: 30.0),
                    // child:Expanded(

                    child: ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      itemCount: eventList.length,
                      itemBuilder: (context, index) {
                        final EventData event = eventList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                DetailEventView(eventData: event,)
                            ));
                          },
                          child:  Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: ProgramCard(
                              image: event.imageUrl,
                              date: event.date,
                              textTitle: event.title,
                              textSubTitle: event.description!,
                              views: event.views,
                              likes: event.likes,
                              send: event.send,

                            ),
                          ),

                        ) ;

                      },


                    ),
                  )

              )



            ]
        )
    );
  }
}
