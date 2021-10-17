import 'package:flutter/material.dart';

class MyCustomCompaniesCard extends StatelessWidget {
  MyCustomCompaniesCard({this.imagePath});
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Image.network(
          imagePath,
          height: 60,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            return Center(child: child);
          },
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
        ),
      ),
    );
  }
}
