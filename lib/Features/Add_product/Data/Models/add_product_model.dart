import 'dart:io';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Etities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  @override
  final String name;
  @override
  final num price;
  //final Color color;
  @override
  final String code;
  @override
  final String description;
  @override
  final String category;
  @override
  final bool isFavotite;
  @override
  final File? image;
  @override
  String? imageUrl;

  AddProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.category,
    required this.isFavotite,
    required this.image,
    this.imageUrl,
  }) : super(
          name: name,
          price: price,
          code: code,
          description: description,
          category: category,
          isFavotite: isFavotite,
          image: image,
          imageUrl: imageUrl,
        );

  factory AddProductModel.fromEntity(AddProductEntity addProductEntity) {
    return AddProductModel(
      name: addProductEntity.name,
      price: addProductEntity.price,
      code: addProductEntity.code,
      description: addProductEntity.description,
      category: addProductEntity.category,
      isFavotite: addProductEntity.isFavotite,
      image: addProductEntity.image,
      imageUrl: addProductEntity.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'category': category,
      'isFavotite': isFavotite,
      'imageUrl': imageUrl,
    };
  }
}
