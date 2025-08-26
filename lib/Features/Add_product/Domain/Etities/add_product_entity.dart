//import 'package:flutter/material.dart';

class AddProductEntity {
  final String name;
  final String price;
  //final Color color;
  final int code;
  final String description;
  final String category;
  final bool isFavotite;
  final String image;
  String imageUrl;

  AddProductEntity(
      {required this.name,
      required this.price,
     // required this.color,
      required this.code,
      required this.description,
      required this.category,
      required this.isFavotite,
      required this.image,
      required this.imageUrl});
}
