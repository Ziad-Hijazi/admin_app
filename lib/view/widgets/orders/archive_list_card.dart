import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:admin/controller/orders/archive_controller.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/core/constants/routes.dart';
import '../../../data/model/orders_model.dart';

class CardArchiveOrdersList extends GetView<ArchiveOrdersController> {
  final OrdersModel listData;

  const CardArchiveOrdersList({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listData.ordersId.toString()}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy(listData.ordersDatetime, "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
                "Order Type : ${controller.printOrderType(listData.ordersType!)}"),
            Text("Order Price : ${listData.ordersPrice}\$"),
            Text("admin Price : ${listData.ordersPricedelivery}\$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listData.ordersPaymentmethod!)}"),
            Text(
                "Order Status : ${controller.printOrderStatus(listData.ordersStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listData.ordersTotalprice}\$",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.ordersDetails,
                        arguments: {"ordersmodel": listData});
                  },
                  color: AppColor.primaryColor2a,
                  textColor: AppColor.primaryColor2,
                  child: const Text("Details"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
