import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlingData.dart';
import '../../core/functions/upload_file.dart';

class EditCategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController nameAr;
  CategoriesModel? categoriesModel;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? file;
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": nameAr.text,
        "imageold": categoriesModel!.categoriesImage,
        "id": categoriesModel!.categoriesId,
      };
      var response = await categoriesData.edit(data, file);
      // var response = await categoriesData.edit(data);

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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    nameAr = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    nameAr.text = categoriesModel!.categoriesNameAr!;

    super.onInit();
  }
}
