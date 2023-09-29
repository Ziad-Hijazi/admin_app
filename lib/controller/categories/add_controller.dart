import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlingData.dart';
import '../../core/functions/upload_file.dart';

class AddCategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController nameAr;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? file;
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": nameAr.text,
      };
      if (file == null) Get.snackbar("Warning", "Please Choose Image SVG");

      var response = await categoriesData.add(data, file!);
      // var response = await categoriesData.add(data);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.viewCategories);
          ViewCategoriesController c = Get.find();
          c.viewData();
        } else {
          statusRequest = StatusRequest.nodatafailure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();
    super.onInit();
  }
}
