import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_dash_board_app/Core/Errors/failure.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Etities/add_product_entity.dart';

abstract class AddProductRepo {
  Future<Either<Failure, String>> uploadImage({required File myFile});

  Future<Either<Failure, void>> addProduct(
      {required AddProductEntity addProductEntity});
}
