import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/OrdersScreen_controller.dart';
import '../../../core/constants/color.dart';
import '../../widgets/orders/custom_bottom_app_bar_home.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreenControllerImp());
    return GetBuilder<OrdersScreenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text("Orders")),
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
