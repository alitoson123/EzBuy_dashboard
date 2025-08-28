import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Add_product_repo/add_product_repo.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Etities/add_product_entity.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/View_model/Add_product_cubit/add_product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit(this.addProductRepo) : super(AddProductInitialState());

  final AddProductRepo addProductRepo;

  Future<void> AddProductCubitMethod(
      {required AddProductEntity addProductEntity}) async {
    emit(AddProductLoadingState());
    var imageUrl =
        await addProductRepo.uploadImage(myFile: addProductEntity.image!);

    imageUrl.fold(
      (failed) => emit(
        AddProductFailedState(errMessage: 'There was some thing wrong 1'),
      ),
      (success) async {
        addProductEntity.imageUrl = success;
        var result =
            await addProductRepo.addProduct(addProductEntity: addProductEntity);
        result.fold(
            (failed) => emit(
                  AddProductFailedState(
                      errMessage: 'There was some thing wrong 2'),
                ),
            (success) => emit(AddProducSuccessState()));
      },
    );
  }
}
