import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class AcceptedOrdersData {
  Crud crud;

  AcceptedOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePrepare(Map data) async {
    var response = await crud.postData(AppLink.prepareOrders, data);
    return response.fold((l) => l, (r) => r);
  }
}
