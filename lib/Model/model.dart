import 'package:flutter/material.dart';

class ProductDetail {
  late int id, price;
  late String title, description, category, image;
  late Ratings ratings;

  ProductDetail({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.ratings,
  });

  factory ProductDetail.fromJson(Map m1) {
    return ProductDetail(
        id: m1['id'],
        price: m1['price'],
        title: m1['title'],
        description: m1['description'],
        category: m1['category'],
        image: m1['image'],
        ratings: Ratings.fromJson(m1['ratings']));
  }
}

class Ratings {
  late int rate, count;

  Ratings({required this.rate, required this.count});

  factory Ratings.fromJson(Map m1) {
    return Ratings(rate: m1['rate'], count: m1['count']);
  }
}
