import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = 'https://app.xn--istekapnda-3ub.com';

  postData(data, apiUrl) async {
    final fullUrl = Uri.parse(_url + apiUrl + await _getToken());
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    final fullUrl = Uri.parse(_url + apiUrl + await _getToken());
    return await http.get(fullUrl, headers: _setHeaders());
  }

  getHomePage() async {
    final String _url = 'https://app.xn--istekapnda-3ub.com/api/homepage';
    final fullUrl = Uri.parse(_url + await _getToken());
    return await http.get(fullUrl);
  }

  getCartList() async {
    final String _url = 'https://app.xn--istekapnda-3ub.com/api/sepetim';
    final fullUrl = Uri.parse(_url + await _getToken());
    return await http.get(fullUrl);
  }

  getProductDetail(urunId) async {
    final String _url = 'https://app.xn--istekapnda-3ub.com/api/urun-detay/';
    final fullUrl = Uri.parse(_url + urunId + await _getToken());
    return await http.get(fullUrl);
  }

  _setHeaders() => {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}
