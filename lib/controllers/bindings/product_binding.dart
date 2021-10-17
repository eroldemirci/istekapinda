import 'package:deneme_yeni_istekapinda/controllers/productlist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ProductListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductListController>(ProductListController());
  }
}
