import 'package:deneme_yeni_istekapinda/commonWidgets/carousel.dart';
import 'package:deneme_yeni_istekapinda/commonWidgets/homePage_categoryNames.dart';
import 'package:flutter/material.dart';

import '../models/homePageApi.dart';
import '../services/response_services.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  Rx<HomePageApi> gelenVeri = null.obs;
  // RxList<String> kategoriler =
  //     ['Kampanyalı ürünler', 'Çok Satanlar', 'En Favori ürünler'].obs;

  RxList<MyCategoryNamesCard> kategoriler = [
    MyCategoryNamesCard(
      name: 'Kampanyalı Ürünler',
      id: 'campaigns',
    ),
    MyCategoryNamesCard(
      name: 'Çok Satanlar',
      id: 'bestsellers',
    ),
    MyCategoryNamesCard(
      name: 'Favori Ürünler',
      id: 'favorites',
    )
  ].obs;

  List<CarouselWidget> carouselImages = [];

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    print('getx başladı');
    fetchHomePage();
    super.onInit();
  }

  @override
  void onClose() {
    print('getx kapandı');
    super.onClose();
  }

  @override
  void onReady() {
    print('getx hazır');
    super.onReady();
  }

  void fetchHomePage() async {
    try {
      isLoading.value = true;
      var result = await ServiceResponse().getHomePage();
      print(result);
      if (result != null) {
        gelenVeri = result.obs;
        carouselImages.clear();
        for (var i = 0; i < gelenVeri.value.categories.length; i++) {
          kategoriler.add(MyCategoryNamesCard(
            name: gelenVeri.value.categories[i].name,
            id: gelenVeri.value.categories[i].id,
            imagePath: gelenVeri.value.categories[i].logoPhotoPath,
          ));
        }
        for (var i = 0; i < gelenVeri.value.slides.length; i++) {
          carouselImages.add(
            CarouselWidget(
                id: gelenVeri.value.slides[i].id,
                image: gelenVeri.value.slides[i].imagePath),
          );
        }
      } else {
        print('Hata oluştu');
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }
}
