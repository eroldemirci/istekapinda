import '../models/loginApi.dart';
import '../models/userCartList_model.dart';

class GetData {
  Future<UserCartList> getCartListData() async {
    var response = await CallApi().getCartList();

    if (response.statusCode == 200) {
      final Object cartListData = UserCartList.fromJson(response.body);
      return cartListData;
    } else
      throw Exception('Bağlantıda Hata oluştu  ${response.statusCode}');
  }
}
