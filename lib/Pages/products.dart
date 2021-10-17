import 'dart:convert';

import 'cartList.dart';
import '../models/loginApi.dart';
import '../models/urundetay_model.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailPage extends StatefulWidget {
  int urunId;
  String urunSlug;
  ProductDetailPage({this.urunId});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final GlobalKey expansionTileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    int _gelenUrunId = widget.urunId;

    /* var urlApi = Uri.http(
        'http://app.xn--istekapnda-3ub.com/api/urun-detay/', ' $_gelenUrunId');

     String _url =
        'http://app.xn--istekapnda-3ub.com/api/urun-detay/$_gelenUrunId';
        */

    Future<UrunDetay> _urunBilgisiGetir() async {
      var response = await CallApi().getProductDetail('$_gelenUrunId');

      if (response.statusCode == 200) {
        return UrunDetay.fromJson(json.decode(response.body));
      } else
        throw Exception('Bağlantıda Hata oluştu  ${response.statusCode}');
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.greenAccent[400],
        toolbarHeight: 40,
        centerTitle: true,
        title: Text(
          'Online Süpermarket',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => CartList(),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _urunBilgisiGetir(),
        builder: (BuildContext context, AsyncSnapshot<UrunDetay> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400],
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 100,
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.all(15),
                            child: Text(
                              '% ${(double.parse(snapshot.data.product.discount)).toStringAsFixed(0)} İndirim',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.redAccent[700],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                        Container(
                          child: Image.network(
                            '${snapshot.data.product.imagePath}',
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: 30,
                              child: Text(
                                '${snapshot.data.product.name}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Birim : ',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontFamily: 'Montserrat'),
                              ),
                              Text(
                                '${snapshot.data.product.unit} ${snapshot.data.product.unitType}',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Kategori : ',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontFamily: 'Montserrat'),
                              ),
                              // snapshot.data.categories[int.parse(snapshot.data.product.categoryId) - 1].name
                              Text(
                                '${snapshot.data.categories[int.parse(snapshot.data.product.categoryId) - 1].name}',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  '₺${(double.parse(snapshot.data.product.salePrice))}',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.black,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                '₺${(double.parse(snapshot.data.product.salePrice) - (double.parse(snapshot.data.product.salePrice) * double.parse(snapshot.data.product.discount) / 100)).toStringAsFixed(2)}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.greenAccent[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 5,
                              ),
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 1.0,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.greenAccent[400],
                              ),
                              child: FlatButton(
                                textColor: Colors.white,
                                hoverColor: Colors.black,
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "Ürün Sepete Eklendi",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.greenAccent[400],
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Text(
                                  'Ürünü Sepete Ekle',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  aciklamaBolumu('${snapshot.data.product.description}'),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget aciklamaBolumu(String aciklama) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          'Ürün Açıklaması',
          style: TextStyle(
              color: Colors.greenAccent[400], fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$aciklama',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('$aciklama',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
