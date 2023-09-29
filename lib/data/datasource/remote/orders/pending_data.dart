import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class PendingOrdersData {
  Crud crud;

  PendingOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String ordersid, String usersid) async {
    var response = await crud.postData(
        AppLink.approveOrders, {"ordersid": ordersid, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
