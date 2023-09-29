import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constants/color.dart';

import '../../../controller/orders/details_controller.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                const TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "Item",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "Quantity",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                ...List.generate(
                                    controller.data.length,
                                    (index) => TableRow(children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 30),
                                            child: Text(
                                                "${controller.data[index].itemsName}",
                                                textAlign: TextAlign.center),
                                          ),
                                          Text(
                                              "${controller.data[index].countitems}",
                                              textAlign: TextAlign.center),
                                          Text(
                                              "${controller.data[index].itemsprice}",
                                              textAlign: TextAlign.center),
                                        ]))
                              ],
                            ),
                            const SizedBox(height: 30),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Total Price : ${controller.ordersModel.ordersTotalprice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    if (controller.ordersModel.ordersType.toString() == "0")
                      Card(
                        child: Container(
                          child: ListTile(
                            title: const Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                          ),
                        ),
                      ),
                  ],
                ))),
      ),
    );
  }
}
