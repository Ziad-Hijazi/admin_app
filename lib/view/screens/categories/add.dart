import 'package:admin/core/class/handling_data_view.dart';
import 'package:admin/core/constants/color.dart';
import 'package:admin/core/functions/validInput.dart';
import 'package:admin/core/shared/custom_button.dart';
import 'package:admin/core/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/categories/add_controller.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoriesController controller = Get.put(AddCategoriesController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Category"),
        ),
        body: GetBuilder<AddCategoriesController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          CustomTextForm(
                              label: "Category Name",
                              hint: "Enter category name",
                              icon: Icons.category_outlined,
                              myController: controller.name,
                              myValidator: (val) => validInput(val!, 2, 20, ""),
                              isNumber: false),
                          CustomTextForm(
                              label: "Category Name (Arabic)",
                              hint: "Enter category name (Arabic)",
                              icon: Icons.category_outlined,
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
                              child: const Text("Choose category image"),
                            ),
                          ),
                          if (controller.file != null)
                            Image.file(controller.file!),
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
