import 'package:deneme_yeni_istekapinda/controllers/productlist_controller.dart';
import 'package:deneme_yeni_istekapinda/models/productList_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  ProductList({@required this.id});
  dynamic id;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductListController _controller = Get.find<ProductListController>();
  @override
  void initState() {
    super.initState();
    print('ProductList Sayfası girildi');
    _controller.setId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProductListController>(
          builder: (productControl) {
            return productControl.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Text(widget.id.toString()),
                      Container(
                        height: 300,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: _controller.gelenVeri[0].products.length,
                            itemBuilder: (context, index) {
                              Product product =
                                  _controller.gelenVeri[0].products[index];
                              return ListTile(
                                title: Text(product.name),
                              );
                            }),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
