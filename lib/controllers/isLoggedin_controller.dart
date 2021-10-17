import 'package:deneme_yeni_istekapinda/models/userAuth_model.dart';
import 'package:deneme_yeni_istekapinda/services/response_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;
  Rx<UserAuthModel> userInfo = null.obs;
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    authController();
    super.onInit();
  }

  void authController() async {
    try {
      isLoading.value = true;
      var result = await ServiceResponse().isUserAlreadySigned();
      if (result == null) {
        isLoggedIn.value = false;
      } else {
        isLoggedIn.value = true;
        userInfo = result.obs;
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }

  void logOut() {
    isLoggedIn.value = false;
  }
}
