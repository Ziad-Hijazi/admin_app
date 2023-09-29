import 'dart:io';
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlingData.dart';
import '../../core/functions/upload_file.dart';

class EditItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController nameAr;
  ItemsModel? itemsModel;
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
        "imageold": itemsModel!.itemsImage,
        "id": itemsModel!.itemsId,
      };
      var response = await itemsData.edit(data, file);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.viewItems);
          ViewItemsController c = Get.find();
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
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    nameAr = TextEditingController();
    name.text = itemsModel!.itemsName!;
    nameAr.text = itemsModel!.itemsNameAr!;

    super.onInit();
  }
}
