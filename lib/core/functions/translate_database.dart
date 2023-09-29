import 'package:get/get.dart';
import 'package:admin/core/services/services.dart';

translateDatabase(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
