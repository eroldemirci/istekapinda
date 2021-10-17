import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCategoryNamesCard extends StatelessWidget {
  MyCategoryNamesCard({this.name, this.imagePath, @required this.id});
  String name;
  String imagePath;
  dynamic id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imagePath != null
                ? Expanded(
                    flex: 6,
                    child: Image.network(
                      imagePath,
                      width: size.width * 0.5,
                      height: size.height * 0.5,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        return Center(child: child);
                      },
                      headers: {
                        'Accept': 'application/json',
                        'Content-type': 'application/json',
                      },
                    ),
                  )
                : Expanded(
                    flex: 6,
                    child: Icon(
                      Icons.campaign_outlined,
                      size: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
            Expanded(
              flex: 4,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Colors.black, letterSpacing: .3, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
