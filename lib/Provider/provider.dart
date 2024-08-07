import 'dart:convert';

import 'package:advance_flutter_exam/ApiHelper/apiHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/model.dart';

class ExamProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();

  // EcommerceModel? ecommerceModel;
  ProductDetail? productDetail;
  // EcommerceModel? ecommerceModel;
  List <String>cart = [];

  // List<String> cart = [];

  // List<EcommerceModel> cartList = [];

  Future<ProductDetail?> fromApi() async {
    // final data = await apiHelper.fetchApiEcommerceData();
    dynamic data = await apiHelper.fetchApiEcommerceData();
    productDetail = ProductDetail.fromJson(data);

    return productDetail;
  }
Future<void> addCard(String name, String temp) async {
  String data = '$name-$temp';
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  cart.add(data);

  sharedPreferences.setStringList('cart', cart);
  notifyListeners();
}

Future<void> getCart() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  cart = sharedPreferences.getStringList('cart') ?? <String>[];
  notifyListeners();
}

Future<void> delete(int index) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  cart.removeAt(index);
  sharedPreferences.setStringList('cart', cart);
  notifyListeners();
}

ExamProvider() {
  getCart();
}
}

List ecomList = [
  {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description":
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {"rate": 3.9, "count": 120}
  }
];


