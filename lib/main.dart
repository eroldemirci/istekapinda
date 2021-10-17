import 'dart:async';

import 'package:deneme_yeni_istekapinda/Pages/searchPage.dart';
import 'package:deneme_yeni_istekapinda/controllers/isLoggedin_controller.dart';
import 'package:deneme_yeni_istekapinda/controllers/navBar_controller.dart';
import 'package:deneme_yeni_istekapinda/services/response_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'Pages/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Pages/campaigns.dart';
import 'Pages/cartList.dart';
import 'Pages/homePage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'İsteKapında',
      theme: ThemeData(
        primaryColor: HexColor('#18d26e'),
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => MyBottomNavBar(),
        '/cartList': (context) => CartList(),
        '/search': (context) => SearchPage(),
        '/splash': (context) => SplashScreen(),
      },
      initialRoute: '/splash',
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyBottomNavBar())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.shopping_cart_sharp,
                size: 64,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              'İstekapında',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'İstekapında Hemen Yanında',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({this.initialIndex});
  int initialIndex = 0;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  final BottomNavBarController _navBarController =
      Get.put(BottomNavBarController());

  List<Widget> _buildScreens() {
    return [
      MyHomePage(),
      SearchPage(),
      CartList(),
      CampaignsPage(),
      UserProfile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Ana Sayfa"),
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        title: ("Arama"),
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: ("Sepetim"),
        onPressed: (BuildContext context) {
          Get.to(CartList());
        },
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.campaign),
        title: ("Kampanyalar"),
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_fill),
        title: ("Profil"),
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),

      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.bounceInOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style11, // Choose the nav bar style with this property.
    );
  }
}
