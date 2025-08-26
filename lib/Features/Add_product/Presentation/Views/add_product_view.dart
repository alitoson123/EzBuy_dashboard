import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/Views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Add Product',
      ),
      body: const AddProductViewBody(),
    );
  }
}
