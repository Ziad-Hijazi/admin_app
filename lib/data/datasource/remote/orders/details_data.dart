import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.detailsOrders, {"ordersid": id});
    return response.fold((l) => l, (r) => r);
  }
}
