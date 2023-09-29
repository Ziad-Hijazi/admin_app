import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/items/view_controller.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Items"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addItems);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<ViewItemsController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                    onWillPop: () {
                      return controller.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, i) {
                              return Card(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.network(
                                            height: 80,
                                            "${AppLink.imagesItems}/${controller.data[i].itemsImage}"),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListTile(
                                          title: Text(controller
                                              .data[i].itemsName!),
                                          subtitle: Text(controller
                                              .data[i].itemsDate!),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons
                                                    .delete_outline_outlined),
                                                onPressed: () {
                                                  Get.defaultDialog(
                                                    title: "Warning",
                                                    middleText:
                                                        "Are sure of the deleting process",
                                                    onCancel: () {},
                                                    onConfirm: () {
                                                      controller.deleteItem(
                                                          controller.data[i]
                                                              .itemsId!,
                                                          controller.data[i]
                                                              .itemsImage!);
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons
                                                    .edit),
                                                onPressed: () {
                                                  controller.goToEditItem(controller.data[i]);
                                                },
                                              ),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              );
                            })),
                  ),
                )));
  }
}
