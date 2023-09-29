import 'package:admin/linkapi.dart';
import '../../../../core/class/crud.dart';

class ArchiveOrdersData {
  Crud crud;

  ArchiveOrdersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewarchiveOrders, {});
    return response.fold((l) => l, (r) => r);
  }

}
