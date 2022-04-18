import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/core/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>?> getAllProducts() async {
    try {
      var token = await localManager.getBoolValue(LocalManagerKeys.isUserLogged)
          ? localManager.getStringValue(LocalManagerKeys.accessToken)
          : accessToken;
      var url = Uri.parse(apiUrl + '/product/all');
      var response = await http.get(
        url,
        headers: {
          'access-token': token,
        },
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return List.generate(data['products'].length, (index) => ProductModel.fromJson(data['products'][index]));
      } else {
        authService.toastMessage(message: data['reason'], color: MainColors.warning);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future getProduct(String id) async {
    try {
      var token = await localManager.getBoolValue(LocalManagerKeys.isUserLogged)
          ? localManager.getStringValue(LocalManagerKeys.accessToken)
          : accessToken;
      var url = Uri.parse(apiUrl + '/product/get/$id');
      var response = await http.get(
        url,
        headers: {
          'access-token': token,
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return 'liked';
      } else if (response.statusCode == 500) {
        return 'error';
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> likeProduct({required String id}) async {
    try {
      var token = await localManager.getBoolValue(LocalManagerKeys.isUserLogged)
          ? localManager.getStringValue(LocalManagerKeys.accessToken)
          : accessToken;
      var url = Uri.parse(apiUrl + '/product/like');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'access-token': token,
        },
        body: jsonEncode(
          {
            'productId': id,
          },
        ),
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        authService.toastMessage(message: data['status'], color: MainColors.success);
        return data['status'];
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        authService.toastMessage(
          message: data['reason'],
          color: MainColors.warning,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> unlikeProduct({required String id}) async {
    try {
      var token = await localManager.getBoolValue(LocalManagerKeys.isUserLogged)
          ? localManager.getStringValue(LocalManagerKeys.accessToken)
          : accessToken;
      var url = Uri.parse(apiUrl + '/product/unlike');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'access-token': token,
        },
        body: jsonEncode(
          {
            'productId': id,
          },
        ),
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        authService.toastMessage(message: data['status'], color: MainColors.success);
        return data['status'];
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        authService.toastMessage(
          message: data['reason'],
          color: MainColors.warning,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
