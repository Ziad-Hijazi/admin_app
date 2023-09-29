import 'package:admin/controller/items/add_controller.dart';
import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/core/functions/validInput.dart';
import 'package:admin/core/shared/custom_button.dart';
import 'package:admin/core/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemsController controller = Get.put(AddItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Item"),
        ),
        body: GetBuilder<AddItemsController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          CustomTextForm(
                              label: "Item Name",
                              hint: "Enter Item name",
                              icon: Icons.add_box,
                              myController: controller.name,
                              myValidator: (val) => validInput(val!, 2, 20, ""),
                              isNumber: false),
                          CustomTextForm(
                              label: "Item Name (Arabic)",
                              hint: "Enter item name (Arabic)",
                              icon: Icons.add_box_rounded,
                              myController: controller.nameAr,
                              myValidator: (val) => validInput(val!, 2, 20, ""),
                              isNumber: false),
                          CustomTextForm(
                              label: "Item Description",
                              hint: "Enter item Description",
                              icon: Icons.add_box_rounded,
                              myController: controller.desc,
                              myValidator: (val) => validInput(val!, 2, 40, ""),
                              isNumber: false),
                          CustomTextForm(
                              label: "Item Description (Arabic)",
                              hint: "Enter item Description (Arabic)",
                              icon: Icons.add_box_rounded,
                              myController: controller.descAr,
                              myValidator: (val) => validInput(val!, 2, 40, ""),
                              isNumber: false),
                          CustomTextForm(
                              label: "count",
                              hint: "Enter item count",
                              icon: Icons.numbers,
                              myController: controller.count,
                              isNumber: true),
                          CustomTextForm(
                              label: "price",
                              hint: "Enter item price",
                              icon: Icons.money,
                              myController: controller.price,
                              isNumber: true),
                          CustomTextForm(
                              label: "dicount",
                              hint: "Enter item dicount",
                              icon: Icons.discount,
                              myController: controller.discount,
                              isNumber: true),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              textColor: AppColor.primaryColor2,
                              color: AppColor.primaryColor2a,
                              onPressed: () {
                                controller.showOptionImage();
                              },
                              child: const Text("Choose item image"),
                            ),
                          ),
                          if (controller.file != null)
                            SvgPicture.file(controller.file!),
                          CustomButton(
                            text: "Add",
                            onPressed: () {
                              controller.addData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
