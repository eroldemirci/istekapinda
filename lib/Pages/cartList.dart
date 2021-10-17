import 'dart:convert';

import 'package:deneme_yeni_istekapinda/controllers/isLoggedin_controller.dart';
import 'package:deneme_yeni_istekapinda/controllers/user_cartList_controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/getwidget.dart';

import 'loginPage.dart';
import '../models/loginApi.dart';
import '../models/userCartList_model.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartList extends StatefulWidget {
  CartList({Key key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Cartlist init başladı');
  }

  int itemcount = 1;
  double fiyat = 16.75;

  AuthController authController = Get.find();
  CartListController cartController = Get.put(CartListController());

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: MyAppBar(),
      body: GetBuilder<CartListController>(
        builder: (_controller) {
          return _controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ))
              : Column(
                  children: [
                    Text('Sepetim'),
                    ListView.builder(
                        itemCount: _controller.gelenVeri.value.products.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            title: Text(_controller
                                .gelenVeri.value.products[index].name),
                          );
                        }),
                  ],
                );
        },
      ),
    );
  }

  AppBar MyAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'Sepetteki Ürünler',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
    );
  }

  ListView buildBody(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 1,
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: EdgeInsets.only(right: 15, left: 15, top: 5),
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 2.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Image.asset(
                            'assets/images/ornekUrun.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Altıncezve 3Ü1 Arada Poşet (250 g)',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Fiyat : ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '$fiyat ₺',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        itemcount > 0 ? itemcount-- : null;
                                      });
                                    },
                                    child: Container(
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  Container(
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('$itemcount'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        itemcount++;
                                      });
                                    },
                                    child: Container(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              itemcount = 0;
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.greenAccent[400],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
