import 'dart:io';

import 'package:admin/linkapi.dart';

import '../../../core/class/crud.dart';

class CategoriesData {
  Crud crud;

  CategoriesData(this.crud);

  view() async {
    var response = await crud.postData(AppLink.viewCategories, {});
    return response.fold((l) => l, (r) => r);
  }

  // add(Map data) async {
  //   var response = await crud.postData(AppLink.addCategories, data);
  //   return response.fold((l) => l, (r) => r);
  // }

  // edit(Map data) async {
  //   var response = await crud.postData(AppLink.editCategories, data);
  //   return response.fold((l) => l, (r) => r);
  // }
  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.addCategories, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.editCategories, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLink.editCategories, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.deleteCategories, data);
    return response.fold((l) => l, (r) => r);
  }
}
