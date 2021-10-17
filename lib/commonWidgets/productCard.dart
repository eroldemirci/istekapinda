import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductCard extends StatelessWidget {
  CustomProductCard(
      {Key key,
      @required this.id,
      @required this.name,
      @required this.imagePath,
      this.price,
      this.salePrice,
      this.discount});

  int id;
  String imagePath;
  String name;
  String price;
  String salePrice;
  String discount;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(imagePath),
              height: 100,
              width: 100,
              filterQuality: FilterQuality.low,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(salePrice,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  Text(price,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                height: 30,
                onPressed: () {
                  print('sepete eklendi');
                },
                child: Text(
                  'Sepete Ekle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(3),
            child: Text(
              '%' + discount,
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          top: 5,
          left: 5,
        ),
        Positioned(
          child: FavoriteButton(
            iconColor: Theme.of(context).primaryColor,
            valueChanged: null,
            iconSize: 36,
          ),
          top: 5,
          right: 5,
        ),
      ],
    ));
  }
}
