import 'dart:convert';

import 'package:deneme_yeni_istekapinda/models/productList_models.dart';
import 'package:deneme_yeni_istekapinda/models/userAuth_model.dart';
import 'package:deneme_yeni_istekapinda/models/userCartList_model.dart';

import '../models/homePageApi.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceResponse {
  static const BASE_URL = 'https://app.xn--istekapnda-3ub.com/api/';
  static var client = http.Client();

  Future<void> logout() async {
    var response = await getData('logout');
    var body = jsonDecode(response.body);
    print(body);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      localStorage.remove('token');
    }
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

  postData(data, apiUrl) async {
    final fullUrl = Uri.parse(BASE_URL + apiUrl + await _getToken());
    return await client.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    final fullUrl = Uri.parse(BASE_URL + apiUrl + await _getToken());
    print('Full Url = ' + fullUrl.toString());
    return await client.get(fullUrl, headers: _setHeaders());
  }

  Future<HomePageApi> getHomePage() async {
    http.Response response = await getData('homepage');
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return HomePageApi.fromJson(body);
    } else
      throw Exception('Bağlantıda Hata oluştu  ${response.statusCode}');
  }

  Future<UserAuthModel> isUserAlreadySigned() async {
    http.Response response = await getData('user-auth');
    var body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200) {
      return UserAuthModel.fromJson(body);
    } else if (response.statusCode == 401) {
      return null;
    } else {
      return null;
    }
  }

  Future<List<ProductListModel>> getProductList(dynamic id) async {
    http.Response response = await getData('categories/$id');
    var body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return productListModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      return null;
    } else {
      return null;
    }
  }

  Future<UserCartList> getCartListData() async {
    var response = await getData('sepetim');
    var body = json.decode(response.body);
    print(body);

    if (response.statusCode == 200) {
      UserCartList gelenData =
          UserCartList.fromJson(json.decode(response.body));

      return gelenData;
    } else if (response.statusCode == 421) {
      return null;
    } else
      throw Exception('Bağlantıda Hata oluştu  ${response.statusCode}');
  }
}
