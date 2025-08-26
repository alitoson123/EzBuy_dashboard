import 'package:dartz/dartz.dart';
import 'package:e_commerce_dash_board_app/Core/Errors/failure.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Add_product_repo/add_product_repo.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Etities/add_product_entity.dart';

class AddProductRepoImpl extends AddProductRepo {
  @override
  Future<Either<Failure, AddProductEntity>> addProduct() {
    // TODO: implement addImage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AddProductEntity>> uploadImage() {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
