import 'package:e_commerce_dash_board_app/Features/dashboard/views/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: DashboardViewBody(),
    );
  }
}
