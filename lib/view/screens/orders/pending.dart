import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/controller/orders/pending_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';

import '../../widgets/orders/orders_list_card.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<PendingOrdersController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) =>
                      CardOrdersList(listData: controller.data[i])))),
    );
  }
}
