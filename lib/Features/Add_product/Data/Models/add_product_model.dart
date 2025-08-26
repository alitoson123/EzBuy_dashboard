import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Etities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  final String name;
  final String price;
  //final Color color;
  final int code;
  final String description;
  final String category;
  final bool isFavotite;
  final String image;
  String imageUrl;

  AddProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.category,
    required this.isFavotite,
    required this.image,
    required this.imageUrl,
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


    factory AddProductModel.fromEntity(AddProductEntity addProductEntity){
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

  
}