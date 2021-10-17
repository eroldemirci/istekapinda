import 'package:deneme_yeni_istekapinda/Pages/loginPage.dart';
import 'package:deneme_yeni_istekapinda/models/userCartList_model.dart';
import 'package:deneme_yeni_istekapinda/services/response_services.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  Rx<UserCartList> gelenVeri = null.obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getCartList();
    print('Cartlist Getx başladı');
    super.onInit();
  }

  @override
  void onReady() {
    print('Cartlist Getx hazır');
    super.onReady();
  }

  @override
  void onClose() {
    print('Cartlist Getx bitti');
    super.onClose();
  }

  void logOut() async {
    await ServiceResponse().logout();
    Get.off(LoginScreen());
  }

  void getCartList() async {
    isLoading.value = true;
    var result = await ServiceResponse().getCartListData();
    if (result != null) {
      gelenVeri = result.obs;
      isLoading.value = false;
    } else {
      logOut();
    }
    update();
  }
}
