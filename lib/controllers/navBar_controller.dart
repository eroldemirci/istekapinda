import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxBool hideNavbar = false.obs;

  void hideNavBarMethod() {
    hideNavbar.value = true;
  }

  void showNavBarMethod() {
    hideNavbar.value = false;
  }
}
