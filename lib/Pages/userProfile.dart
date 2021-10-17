import 'package:deneme_yeni_istekapinda/Pages/loginPage.dart';
import 'package:deneme_yeni_istekapinda/controllers/isLoggedin_controller.dart';
import 'package:deneme_yeni_istekapinda/models/userAuth_model.dart';
import 'package:deneme_yeni_istekapinda/services/response_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AuthController>(
          builder: (_auth) => _auth.isLoggedIn.value
              ? isLoggedinProfile(
                  userAuth: _auth.userInfo.value != null
                      ? _auth.userInfo.value
                      : null,
                  authController: _authController,
                )
              : isNotLoggedinProfile(),
        ),
      ),
    );
  }
}

class isNotLoggedinProfile extends StatelessWidget {
  const isNotLoggedinProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: TextButton(
              onPressed: () => Get.to(LoginScreen()),
              child: Text(
                'Lütfen Giriş Yapınız',
                style: GoogleFonts.sourceSansPro(
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                ),
              )),
        )
      ],
    );
  }
}

class isLoggedinProfile extends StatelessWidget {
  UserAuthModel userAuth;
  AuthController authController;
  isLoggedinProfile({
    Key key,
    this.userAuth,
    this.authController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(userAuth.name + userAuth.lastname),
          subtitle: Text(userAuth.email),
          leading: CircleAvatar(
            child: Text(userAuth.name[0]),
          ),
        ),
        ListTile(
          onTap: () => logOut(),
          title: Text(
            'Çıkış Yap',
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }

  void logOut() async {
    await ServiceResponse().logout();

    authController.authController();
    print('Çıkış Yapıldı');
    Get.offAll(MyBottomNavBar());
  }
}
