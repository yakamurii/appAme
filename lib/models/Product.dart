import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    // @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/alarm-clock.png",
      "assets/images/horario.png",
      "assets/images/horario2.png",
      "assets/images/horario3.png",
      "assets/images/horario4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Horário das Mamadas",
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/wash-your-hands.png",
      "assets/images/higienizacao1.png",
      "assets/images/higienizacao2.png",
      "assets/images/higienizacao3.png",
      "assets/images/higienizacao4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Higienização",
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/breastfeeding.png",
      "assets/images/posicoes1.png",
      "assets/images/posicoes2.png",
      "assets/images/posicoes3.png",
      "assets/images/posicoes4.png",
      "assets/images/posicoes5.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Posições",
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description = "";
