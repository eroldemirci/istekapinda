import 'package:deneme_yeni_istekapinda/models/productList_models.dart';
import 'package:deneme_yeni_istekapinda/services/response_services.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  dynamic id = null.obs;
  RxBool isLoading = true.obs;
  RxList<ProductListModel> gelenVeri = [null].obs;

  @override
  void onReady() {
    getProducts();
    print('ProductListController ready $id');
    super.onReady();
  }

  @override
  void onInit() {
    print('ProductListController  init : $id');
    super.onInit();
  }

  setId(dynamic gelenId) {
    id = gelenId;
    update();
    print('setId gelenId : $gelenId');
    print('setId  id : $id');
  }

  Future<void> getProducts() async {
    try {
      isLoading.value = true;
      var result = await ServiceResponse().getProductList(id);
      if (result != null) {
        gelenVeri = result.obs;
      } else {
        return null;
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }
}
