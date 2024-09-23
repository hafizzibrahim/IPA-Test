
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/app/data/models/event_data.dart';
import 'package:maritimmuda_connect/themes.dart';

import 'package:url_launcher/url_launcher.dart';


class DetailEventView extends StatelessWidget {
  final EventData eventData;
  const DetailEventView({Key? key, required this.eventData}): super (key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: neutral02Color,
      appBar: AppBar(
        title: Text('Detail Event',style: boldText24,),
        centerTitle:true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          const FavoriteButton()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Image.network(
                eventData.imageUrl!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                eventData.title!,
                style: boldText24,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                eventData.descriptionDetail!,
                style: regulerText14,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                style: boldText16,
                'Penyelenggara',
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, ),
              child: Text(
                  style: regulerText14,
                  eventData.organizer!
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                style: boldText16,
                'Waktu',
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, ),
              child: Text(
                  style: regulerText14,
                  eventData.time!
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                  style: boldText16,
                  textAlign: TextAlign.start,
                  'Lokasi'
              ),
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: primaryBlueColor,),
                    SizedBox(width: 8.0,),
                    Text(
                        style: regulerText14,
                        'Golden Ballroom - The Sultan Hotel & Residence, Jakarta'
                    ),
                  ],
                )
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0,  vertical: 8.0),
              child: Text(
                  style: boldText16,
                  'Benefit'
              ),
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _BenefitRowItem(Icons.restaurant_menu_sharp, eventData.benefit[0]!),
                    _BenefitRowItem(Icons.house_outlined, eventData.benefit[1]!),
                    _BenefitRowItem(Icons.card_giftcard, eventData.benefit[2]!),
                  ],
                )
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: primaryDarkBlueColor
                  ),
                  child: Text(
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                      'Daftar'
                  ),
                  onPressed: () {
                    _launchURL(eventData.url!);
                  },

                ),
              ),
            )







          ],
        ),
      ),
    );
  }


}


Widget _BenefitRowItem(IconData icon, String text) {
  return
    Row(
      children: [
        Icon(
          icon, color: primaryBlueColor,
        ),
        SizedBox(width: 8.0,),
        Text(
          text,
          style: regulerText14,
        ),
      ],
    );
}


class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}


class _FavoriteButtonState extends State<FavoriteButton> {

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon:
        Icon(
            isFavorite? Icons.favorite : Icons.favorite_border,
            color: Colors.red
        )
    );
  }

}
