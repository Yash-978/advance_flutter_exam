import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<dynamic> fetchApiEcommerceData() async {
    String api =
        'https://fakestoreapi.com/products?_gl=1*191no3y*_ga*MTkxOTU5NTc1Ni4xNzIzMDE3MjU0*_ga_ZCYG64C7PL*MTcyMzAxNzI1NC4xLjEuMTcyMzAxNzU0OS4wLjAuMA..';
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      dynamic data1 = jsonDecode(json);
      return data1;
    } else {
      return [];
    }
  }
}


