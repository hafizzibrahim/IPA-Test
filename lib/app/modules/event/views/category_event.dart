import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/event_data.dart';
import '../../widget/program_card.dart';
import 'detail_event_view.dart';

class CategoryEvent extends StatelessWidget {
  const CategoryEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailEventView(
                            eventData: event,
                          )));
            },
            child: Padding(
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
          );
        },
      ),
    ));
  }
}
