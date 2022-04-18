import 'package:flutter/material.dart';
import 'package:piton_shop_list/core/core_shelf.dart';
import 'package:piton_shop_list/core/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  LoadingState _loadingState = LoadingState.Initial;
  LoadingState get loadingState => _loadingState;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  Future<void> getProducts() async {
    try {
      _loadingState = LoadingState.Loading;

      final List<ProductModel>? data = await productService.getAllProducts();

      if (data!.isNotEmpty) {
        _loadingState = LoadingState.Loaded;
        _products = data;
        checkisLiked();
      } else {
        _loadingState = LoadingState.Initial;
        notifyListeners();
        return;
      }
    } catch (e) {
      _loadingState = LoadingState.Error;
      print(e.toString());
    }
    notifyListeners();
  }

  Future filterProduct(String word) async {
    final data = await productService.getAllProducts();
    if (word.isNotEmpty) {
      _products = data!.where((element) => (element.name.toLowerCase().contains(word.toLowerCase()))).toList();
      checkisLiked();
    } else {
      _products = data!;
      checkisLiked();
    }
    notifyListeners();
  }

// API yapısı like ve unlike'a uygun değil. ID ile product çektiğimizde daha önce beğenilmemişse api'den error dönüyor.
// Burada ürünün id'si ile product'ı çekmeye çalışıyoruz. Eğer hata dönmezse o product'ın modelindeki isLiked parametresini true döndürüyoruz.

  Future checkisLiked({ProductModel? productModel, int? index}) async {
    if (productModel != null) {
      var response = await productService.getProduct(productModel.id.toString());
      if (response == 'liked') {
        _products[index!].isLiked = true;
      } else if (response == 'error') {
        _products[index!].isLiked = false;
      }
    }
    for (var i = 0; i < _products.length; i++) {
      var response = await productService.getProduct(_products[i].id.toString());
      if (response == 'liked') {
        _products[i].isLiked = true;
      } else if (response == 'error') {
        _products[i].isLiked = false;
      }
    }
    notifyListeners();
  }
}
