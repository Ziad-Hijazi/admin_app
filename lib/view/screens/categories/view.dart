import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategoriesController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addCategories);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<ViewCategoriesController>(
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
                                            "${AppLink.imagesCategories}/${controller.data[i].categoriesImage}"),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListTile(
                                          title: Text(controller
                                              .data[i].categoriesName!),
                                          subtitle: Text(controller
                                              .data[i].categoriesDatetime!),
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
                                                      controller.deleteCategory(
                                                          controller.data[i]
                                                              .categoriesId!,
                                                          controller.data[i]
                                                              .categoriesImage!);
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () {
                                                  controller.goToEditCategory(
                                                      controller.data[i]);
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
