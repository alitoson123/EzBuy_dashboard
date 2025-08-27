//import 'package:flutter/material.dart';

import 'dart:io';

class AddProductEntity {
  final String name;
  final num price;
  //final Color color;
  final String code;
  final String description;
  final String category;
  final bool isFavotite;
  final File? image;
  String? imageUrl;

  AddProductEntity(
      {required this.name,
      required this.price,
     // required this.color,
      required this.code,
      required this.description,
      required this.category,
      required this.isFavotite,
      required this.image,
       this.imageUrl});
}
