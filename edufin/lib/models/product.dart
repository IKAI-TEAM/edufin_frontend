import 'package:edufin/constants.dart';
import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final int price;
  final Map<String, int> addons;

  Product({
    required this.images,
    required this.colors,
    required this.title,
    required this.description,
    required this.price,
    required this.addons,
  });
}

List<Product> demoProduct = [
  Product(
    images: [
      "assets/images/kentang.png",
      "assets/images/kentang.png",
      "assets/images/kentang.png",
    ],
    colors: [
      kMainColor,
      Colors.white,
    ],
    title: "Kentang Goreng",
    description: "bla bla bla bla bla",
    price: 10000,
    addons: {
      "Saos": 2000,
      "Telur": 3000,
      "Sosis": 4000,
    },
  ),
  Product(
    images: [
      "assets/images/burger.png",
      "assets/images/burger.png",
      "assets/images/burger.png",
    ],
    colors: [
      kMainColor,
      Colors.white,
    ],
    title: "Burger",
    description: "bla bla bla bla bla",
    price: 15000,
    addons: {
      "Saos": 2000,
      "Telur": 3000,
      "Sosis": 4000,
      "Nasi": 5000,
    },
  ),
  Product(
    images: [
      "assets/images/ayam.png",
      "assets/images/ayam.png",
      "assets/images/ayam.png",
    ],
    colors: [
      kMainColor,
      Colors.white,
    ],
    title: "Ayam Goreng",
    description: "bla bla bla bla bla",
    price: 15000,
    addons: {},
  ),
];
