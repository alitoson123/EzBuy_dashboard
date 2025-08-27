import 'package:e_commerce_dash_board_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Add_product_repo/add_product_repo.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/View_model/Add_product_cubit/add_product_cubit.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/View_model/Add_product_cubit/add_product_states.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/Views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/widgets/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        getIt<AddProductRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          'Add Product',
        ),
        body: BlocConsumer<AddProductCubit, AddProductStates>(
          listener: (context, state) {
            if (state is AddProducSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('The product added successfully')));
            }
            if (state is AddProductFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('The product added FAILED')));
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: State is AddProductLoadingState ? true : false,
                child: const AddProductViewBody());
          },
        ),
      ),
    );
  }
}
