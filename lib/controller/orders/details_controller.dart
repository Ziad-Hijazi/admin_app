import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handlingData.dart';
import '../../data/datasource/remote/orders/details_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/orders_model.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  late OrdersModel ordersModel;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersModel.ordersId.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getData();
    super.onInit();
  }
}
