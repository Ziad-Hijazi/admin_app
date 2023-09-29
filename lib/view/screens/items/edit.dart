import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/core/functions/validInput.dart';
import 'package:admin/core/shared/custom_button.dart';
import 'package:admin/core/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/categories/edit_controller.dart';
import '../../../controller/items/edit_controller.dart';

class EditItems extends StatelessWidget {
  const EditItems({super.key});

  @override
  Widget build(BuildContext context) {
    EditItemsController controller = Get.put(EditItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Item"),
        ),
        body: GetBuilder<EditItemsController>(
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
                              hint: "Enter Item name (Arabic)",
                              icon: Icons.add_box_outlined,
                              myController: controller.nameAr,
                              myValidator: (val) => validInput(val!, 2, 20, ""),
                              isNumber: false),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              textColor: AppColor.primaryColor2,
                              color: AppColor.primaryColor2a,
                              onPressed: () {
                                controller.chooseImage();
                              },
                              child: const Text("Choose item image"),
                            ),
                          ),
                          if (controller.file != null)
                            SvgPicture.file(controller.file!),
                          CustomButton(
                            text: "Save",
                            onPressed: () {
                              controller.editData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
