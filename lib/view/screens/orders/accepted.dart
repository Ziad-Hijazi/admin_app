import 'package:admin/controller/orders/accepted_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/handling_data_view.dart';
import '../../widgets/orders/orders_list_card_accepted.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<AcceptedOrdersController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) =>
                      CardOrdersListAccepted(listData: controller.data[i])))),
    );
  }
}
