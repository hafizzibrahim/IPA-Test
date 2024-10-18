
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maritimmuda_connect/app/data/models/scholarship_data.dart';
import 'package:maritimmuda_connect/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScholarshipView extends StatelessWidget {
  final ScholarshipData scholarshipData;
  const DetailScholarshipView ({Key? key, required this.scholarshipData}): super (key: key);


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
        title: Text('Detail Scholarship', style: boldText24,),
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
                scholarshipData.imageUrl!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                scholarshipData.title!,
                style: boldText24,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                scholarshipData.descriptionDetail!,
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
                  scholarshipData.organizer!
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                style: boldText16,
                'Benefit',
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, ),
              child: Text(
                  style: regulerText14,
                  scholarshipData.benefit!
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                  style: boldText16,
                  textAlign: TextAlign.start,
                  'Tanggal Penting'
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, ),
              child: Text(
                  style:regulerText14,
                  scholarshipData.timeline!
              ),
            ),


            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Color(0xFF086C9E)
                  ),
                  child: Text(
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                      'Daftar'
                  ),
                  onPressed: () {
                    _launchURL(scholarshipData.url!);
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
