import 'package:carousel_slider/carousel_slider.dart';
import 'package:deneme_yeni_istekapinda/controllers/bindings/product_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:deneme_yeni_istekapinda/Pages/deneme_sayfa.dart';
import 'package:deneme_yeni_istekapinda/Pages/productlist_page.dart';
import 'package:deneme_yeni_istekapinda/commonWidgets/companies_card.dart';
import 'package:deneme_yeni_istekapinda/commonWidgets/searchBar_textfield.dart';
import 'package:deneme_yeni_istekapinda/controllers/isLoggedin_controller.dart';

import '../controllers/homepage_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomePageController _controller = Get.put(HomePageController());
  AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      key: PageStorageKey('key_ana_sayfa'),
      appBar: appBarMyHomePage(context),
      body: buildBody(context, _controller, _authController),
    );
  }

  AppBar appBarMyHomePage(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 5,
      toolbarHeight: screenWidth <= 500
          ? MediaQuery.of(context).size.height * 0.1
          : MediaQuery.of(context).size.height * 0.15,
      centerTitle: true,
      leadingWidth: 60,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Image(
          image: AssetImage('assets/images/sariLogo.png'),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SearchBarContainer(),
      ),
    );
  }

  Widget buildBody(BuildContext context, HomePageController _controller,
      AuthController _authController) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Future _refreshData() async {
      await Future.delayed(Duration(seconds: 3)).then((value) {
        _authController.authController();
        _controller.fetchHomePage();
      });
    }

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (_controller) {
            return _controller.isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: _refreshData,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Slider Bölümü
                          GFCarousel(
                            items: _controller.carouselImages
                                .map(
                                  (carousel) => Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 25.0, top: 10),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Image.network(
                                        carousel.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            enlargeMainPage: true,
                            activeIndicator: Theme.of(context).primaryColor,
                            pagerSize: 8,
                            height: size.height * 0.32,
                            pagination: true,
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            initialPage: 0,
                            viewportFraction: 0.95,
                          ),

                          // Container(
                          //     height: size.height * 0.30,
                          //     width: size.width,
                          //     margin: EdgeInsets.symmetric(vertical: 5),
                          //     child: CarouselSlider.builder(
                          //       itemCount:
                          //           _controller.gelenVeri.value.slides.length,
                          //       itemBuilder: (context, index, realIndex) {
                          //         return ClipRRect(
                          //             borderRadius: BorderRadius.circular(10),
                          //             child: Image(
                          //               image: NetworkImage(
                          //                 _controller.gelenVeri.value
                          //                     .slides[index].imagePath,
                          //                 headers: {
                          //                   'Accept': 'application/json',
                          //                   'Content-type': 'application/json',
                          //                 },
                          //               ),
                          //               fit: BoxFit.fill,
                          //             ));
                          //       },
                          //       options: CarouselOptions(
                          //         autoPlayAnimationDuration:
                          //             Duration(milliseconds: 200),
                          //         autoPlayInterval: Duration(seconds: 5),
                          //         enlargeStrategy:
                          //             CenterPageEnlargeStrategy.scale,
                          //         autoPlay: true,
                          //         viewportFraction: 0.95,
                          //         pageSnapping: true,
                          //         enlargeCenterPage: true,
                          //       ),
                          //     )),
                          // Kategoriler Başlık Bölümü
                          Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                EdgeInsets.only(top: 20, left: 5, bottom: 20),
                            child: Text(
                              'Kategoriler',
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: .3,
                                    fontSize: 18),
                              ),
                            ),
                          ),

                          // Kategoriler  Bölümü

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _controller.kategoriler.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: screenWidth <= 500 ? 1 : 1.5,
                                crossAxisCount: screenWidth <= 500 ? 3 : 5,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () =>
                                        index == 0 || index == 1 || index == 2
                                            ? Get.to(Deneme())
                                            : Get.to(
                                                ProductList(
                                                  id: _controller.kategoriler
                                                      .value[index].id,
                                                ),
                                                binding: ProductListBindings()),
                                    child:
                                        _controller.kategoriler.value[index]);
                              },
                            ),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              top: 20,
                              left: 5,
                            ),
                            child: Text(
                              'Markalar',
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: .3,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Container(
                              height: 120,
                              color: Colors.white,
                              alignment: Alignment.centerLeft,
                              margin:
                                  EdgeInsets.only(top: 5, left: 5, bottom: 20),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _controller
                                      .gelenVeri.value.companies.length,
                                  itemBuilder: (context, index) => Container(
                                      height: 100,
                                      width: 100,
                                      child: MyCustomCompaniesCard(
                                        imagePath: _controller.gelenVeri.value
                                            .companies[index].logoPhotoPath,
                                      )))),

                          //Marka Listesi
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
