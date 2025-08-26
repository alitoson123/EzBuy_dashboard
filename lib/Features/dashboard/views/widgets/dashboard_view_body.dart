import 'package:e_commerce_dash_board_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_dash_board_app/Core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              GoRouter.of(context).go(Navigate.KAddProductPage);
            },
            text: 'Add Data',
          ),
          const SizedBox(
            height: 16,
          ),
          /*MyelevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, OrdersView.routeName);
            },
            text: 'View Orders',
          ),*/
        ],
      ),
    );
  }
}
