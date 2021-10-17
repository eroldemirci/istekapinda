import 'dart:convert';

import 'package:deneme_yeni_istekapinda/controllers/isLoggedin_controller.dart';
import 'package:get/get.dart';

import '../models/loginApi.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool signin = true;
  bool signup = false;

  bool _autoValidateLogin = false;
  bool _autoValidateRegister = false;
  TextEditingController emailGiris,
      pwGiris,
      emailKayit,
      pwKayit,
      pwTekrar,
      adKayit,
      soyadKayit,
      telKayit;

  bool _isSignInLoading = false;
  bool _isSignupLoading = false;
  bool _value = false;
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');

  GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _validateEmailGiris(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      // erol@gg.cg
      return 'Geçersiz Email';
    } else
      return null;
  }

  String _validatePassGiris(String value) {
    if (value.isEmpty) {
      return 'Şifre Boş Bırakılamaz!';
    } else if (value.length < 7) {
      return 'Şifre 6 dan Büyük Olmalıdır!';
    } else
      return null;
  }

  String _validateAd(String value) {
    if (value.isEmpty) {
      return 'Şifre Boş Bırakılamaz!';
    } else if (!nameRegExp.hasMatch(value)) {
      return 'Uygun bir isim girin';
    } else
      return null;
  }

  String _validateSoyAd(String value) {
    if (value.isEmpty) {
      return 'Şifre Boş Bırakılamaz!';
    } else if (!nameRegExp.hasMatch(value)) {
      return 'Uygun bir isim girin';
    } else
      return null;
  }

  String _validateEmailKayit(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      // erol@gg.cg
      return 'Geçersiz Email';
    } else
      return null;
  }

  String _validatePassKayit(String value) {
    if (value.isEmpty) {
      return 'Şifre Boş Bırakılamaz!';
    } else if (value.length < 7) {
      return 'Şifre 6 dan Büyük Olmalıdır!';
    } else
      return null;
  }

  String _validateConfirmPass(String val) {
    if (val.isEmpty) {
      return 'Şifre Boş Bırakılamaz!';
    } else if (val.length < 7) {
      return 'Şifre 6 dan Büyük Olmalıdır!';
    } else if (val != pwKayit.text) return 'Şifreler Eşleşmiyor';
    return null;
  }

  String _validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Telefon Numarası Giriniz';
    } else if (!regExp.hasMatch(value)) {
      return 'Telefon Geçerli Bir Numarası Giriniz';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    emailGiris = new TextEditingController();
    pwGiris = new TextEditingController();
    emailKayit = new TextEditingController();
    pwKayit = new TextEditingController();
    pwTekrar = new TextEditingController();
    adKayit = new TextEditingController();
    soyadKayit = new TextEditingController();
    telKayit = new TextEditingController();
  }

  @override
  void dispose() {
    emailGiris.dispose();
    pwGiris.dispose();
    emailKayit.dispose();
    pwKayit.dispose();
    pwTekrar.dispose();
    adKayit.dispose();
    soyadKayit.dispose();
    telKayit.dispose();
    super.dispose();
  }

  _registerUser() async {
    var data = {
      'name': adKayit.text,
      'lastname': soyadKayit.text,
      'email': emailKayit.text,
      'password': pwKayit.text,
      'password_confirmation': pwTekrar.text,
      'tel': telKayit.text,
    };

    setState(() {
      _autoValidateRegister = true;
    });

    if (!_signUpKey.currentState.validate()) {
      return null;
    } else {
      _signUpKey.currentState.save();
      setState(() {
        _isSignupLoading = true;
      });
      var res = await CallApi().postData(data, '/api/register');
      var body = json.decode(res.body);

      print(body);
      print(res.statusCode);
      setState(() {
        _isSignupLoading = false;
      });
      if (res.statusCode == 400) {
      } else if (res.statusCode == 201) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['access_token']);
        localStorage.setString('user', json.encode(body['user']));

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyBottomNavBar()),
            (Route<dynamic> route) => false);
      }
    }
  }

  _userSignIn() async {
    var data = {
      'email': emailGiris.text,
      'password': pwGiris.text,
    };
    setState(() {
      _autoValidateLogin = true;
    });

    if (!_signInKey.currentState.validate()) {
      return null;
    } else {
      _signInKey.currentState.save();

      setState(() {
        _isSignInLoading = true;
      });

      var res = await CallApi().postData(data, '/api/login');

      var body = json.decode(res.body);

      print(body['access_token']);

      if (res.statusCode == 422) {
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(),
              title: Text('Beklenmedik Hata'),
              content:
                  Text('Beklenmedik bir hata oluştu lütfen tekrar deneyin'),
              actions: <Widget>[
                TextButton(
                  child: Text('Kapat'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if (res.statusCode == 401) {
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: AlertDialog(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    title: Text('Kullanıcı adı veya şifre hatalı!'),
                    content: Text('Lütfen tekrar deneyin'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Kapat'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            transitionDuration: Duration(milliseconds: 200),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            // ignore: missing_return
            pageBuilder: (context, animation1, animation2) {});
      } else if (res.statusCode == 200) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['access_token']);
        AuthController _controller = Get.put(AuthController());
        _controller.authController();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MyBottomNavBar()),
            (Route<dynamic> route) => false);
      }
    }

    setState(() {
      _isSignInLoading = false;
    });
  }

  void signUpSecildi() {
    setState(() {
      signup = true;
      signin = false;
    });
  }

  void signInSecildi() {
    setState(() {
      signin = true;
      signup = false;
    });
  }

  Widget signInUi() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      child: Form(
        key: _signInKey,
        child: Column(
          children: <Widget>[
            Container(
              child: TextFormField(
                // ignore: deprecated_member_use
                autovalidate: _autoValidateLogin,
                validator: _validateEmailGiris,
                controller: emailGiris,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_sharp),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelStyle: TextStyle(color: Colors.greenAccent[400]),
                    hintText: 'Email'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: TextFormField(
                // ignore: deprecated_member_use
                autovalidate: _autoValidateLogin,
                validator: _validatePassGiris,
                obscureText: true,
                controller: pwGiris,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline_sharp),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Şifre',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () => _isSignInLoading ? null : _userSignIn(),
              child: _isSignInLoading == false
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[400],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUpUi() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _signUpKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    child: TextFormField(
                      autovalidate: _autoValidateRegister,
                      validator: _validateAd,
                      controller: adKayit,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Colors.greenAccent[400],
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              )),
                          labelText: "Ad",
                          hintText: 'Ad'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Container(
                    child: TextFormField(
                      autovalidate: _autoValidateRegister,
                      validator: _validateSoyAd,
                      controller: soyadKayit,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              )),
                          labelText: "Soyad",
                          hintText: 'Soyad'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: TextFormField(
                autovalidate: _autoValidateRegister,
                validator: _validateEmailKayit,
                controller: emailKayit,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )),
                    labelText: "Email",
                    hintText: 'Email'),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    child: TextFormField(
                      autovalidate: _autoValidateRegister,
                      validator: _validatePassKayit,
                      controller: pwKayit,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Colors.greenAccent[400],
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              )),
                          labelText: "Şifre",
                          hintText: 'Şifre'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Container(
                    child: TextFormField(
                      autovalidate: _autoValidateRegister,
                      validator: _validateConfirmPass,
                      controller: pwTekrar,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Colors.greenAccent[400],
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              )),
                          labelText: "Tekrar",
                          hintText: 'Tekrar'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: TextFormField(
                autovalidate: _autoValidateRegister,
                validator: _validateMobile,
                controller: telKayit,
                maxLength: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  hintText: '5xx xxx xxxx',
                  labelText: "Telefon Numarası",
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: Colors.greenAccent[400],
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    checkColor: Colors.white,
                  ),
                  Expanded(
                    child: Text(
                      'Kullanım koşullarını, Çerez politikasını ve Gizlilik politikasını kabul ediyorum',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
                onPressed: () => _isSignupLoading ? null : _registerUser(),
                child: _isSignupLoading == false
                    ? Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent[400],
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : CircularProgressIndicator(backgroundColor: Colors.red)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: SizerUtil.deviceType,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                            height: 80,
                            width: 300,
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/yLogo.png',
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 25),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                    color: signin == true
                                        ? Colors.greenAccent[400]
                                        : Colors.transparent,
                                  ),
                                  color: signin == true
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: FlatButton(
                                  onPressed: () => signInSecildi(),
                                  child: Text(
                                    'Giriş Yap',
                                    style: TextStyle(
                                      color: signin == true
                                          ? Colors.greenAccent[400]
                                          : Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: signin != true
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: FlatButton(
                                  onPressed: () => signUpSecildi(),
                                  child: Text(
                                    'Kayıt Ol',
                                    style: TextStyle(
                                      color: signup == true
                                          ? Colors.greenAccent[400]
                                          : Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        signin == true ? signInUi() : signUpUi(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "İstekapında Tüm Hakları Saklıdır",
                          style: TextStyle(color: Colors.greenAccent[400]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
