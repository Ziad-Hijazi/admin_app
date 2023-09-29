import 'package:admin/data/model/categories_model.dart';
import 'package:admin/data/model/items_model.dart';
import 'package:get/get.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlingData.dart';

import '../../core/constants/routes.dart';
import '../../data/datasource/remote/items_data.dart';

class ViewItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  viewData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.view();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  deleteItem(String id, String imageName) {
    itemsData.delete({"id": id, "imagename": imageName});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToEditItem(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.editItems,
        arguments: {"itemsModel": itemsModel});
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
