import 'dart:io';

import 'package:admin/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  view() async {
    var response = await crud.postData(AppLink.viewItems, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.addItems, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.editItems, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.editItems, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.deleteItems, data);
    return response.fold((l) => l, (r) => r);
  }
}
