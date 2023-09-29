import 'package:get/get.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/archive_data.dart';
import '../../core/functions/handlingData.dart';
import '../../data/model/orders_model.dart';

class ArchiveOrdersController extends GetxController {
  ArchiveOrdersData archiveOrdersData = ArchiveOrdersData(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Receive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared";
    } else if (val == "2") {
      return "Ready To Picked up by delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveOrdersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.nodatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
