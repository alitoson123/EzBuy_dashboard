import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_dash_board_app/Core/Errors/failure.dart';
import 'package:e_commerce_dash_board_app/Core/Services/ARUD_data_service/ARUD_data.dart';
import 'package:e_commerce_dash_board_app/Core/Services/Storage_service/firebase_storage_service.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Data/Models/add_product_model.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Add_product_repo/add_product_repo.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Etities/add_product_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddProductRepoImpl extends AddProductRepo {
  final ArudData arudData;
  final FirebaseStorageService starageService;

  AddProductRepoImpl({required this.arudData, required this.starageService});

  @override
  Future<Either<Failure, String>> uploadImage({required File myFile}) async {
    try {
      String imageUrl = await starageService.UploadFile(
          pathOfFolder: 'images', myFile: myFile);

      return right(imageUrl);
    } catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addProduct(
      {required AddProductEntity addProductEntity}) async {
    try {
      await arudData.addData(
          documentName: 'products',
          data: AddProductModel.fromEntity(addProductEntity).toMap(),
          userUid: FirebaseAuth.instance.currentUser!.uid);

      return right(null);
    } catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }
}
