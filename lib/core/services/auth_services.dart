import 'dart:convert';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/views/products/productlist/product_list.dart';

class AuthService {
  Future registerUser({
    required String nameSurname,
    required String mail,
    required String password,
  }) async {
    try {
      var url = Uri.parse(apiUrl + '/user/register');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'name': nameSurname,
            'password': password,
            'email': mail,
          }));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        accessToken = data['token'];
        toastMessage(
          message: 'register_success'.translate,
          color: MainColors.success,
        );

        navigatonService.navigateTo(ProductList());
        return data;
      } else {
        toastMessage(message: data['message'], color: MainColors.warning);
      }
    } catch (e) {
      print(e);
    }
  }

  Future loginUser({required String email, required password, required bool rememberMe}) async {
    try {
      var url = Uri.parse(apiUrl + '/user/login');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'password': password,
            'email': email,
          }));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['token'].isNotEmpty) {
          if (rememberMe) {
            localManager.setStringValue(LocalManagerKeys.accessToken, data['token']);
            localManager.setBoolValue(LocalManagerKeys.isUserLogged, true);
          } else if (!rememberMe) {
            accessToken = data['token'];
          }
          toastMessage(
            message: 'login_success'.translate,
            color: MainColors.success,
          );
          navigatonService.navigateToPageClear(ProductList());
        } else if (data['token'].isEmpty) {
          toastMessage(message: 'SomeThing Wrong', color: MainColors.warning);
        }

        return data;
      } else {
        toastMessage(message: data['message'], color: MainColors.warning);
      }
    } catch (e) {
      toastMessage(message: e.toString(), color: MainColors.warning);
    }
  }

  Future<void> toastMessage({required String message, required Color color}) async {
    await Fluttertoast.showToast(msg: message, backgroundColor: color);
  }
}
