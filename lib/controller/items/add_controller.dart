import 'dart:io';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlingData.dart';
import '../../core/functions/upload_file.dart';
import '../../data/datasource/remote/items_data.dart';

class AddItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController desc;
  late TextEditingController descAr;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  String? catId;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? file;

  showOptionImage() {
    showBottomSheetMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Choose Image SVG");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": nameAr.text,
      };
      var response = await itemsData.add(data, file!);
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
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();

    super.onInit();
  }
}
