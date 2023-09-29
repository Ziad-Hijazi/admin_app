import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categories_model.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlingData.dart';

import '../../core/constants/routes.dart';

class ViewCategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;
  viewData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.view();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  deleteCategory(String id, String imageName) {
    categoriesData.delete({"id": id, "imagename": imageName});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goToEditCategory(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.editCategories,
        arguments: {"categoriesModel": categoriesModel});
  }

  back() {
    Get.offAllNamed(AppRoutes.homepage);
    return Future.value(false);
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
