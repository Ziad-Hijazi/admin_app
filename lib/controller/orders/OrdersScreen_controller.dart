import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/screens/orders/pending.dart';
import '../../view/screens/orders/accepted.dart';
import '../../view/screens/orders/archive.dart';

abstract class OrdersScreenController extends GetxController {
  changePage(int currentPage);
}

class OrdersScreenControllerImp extends OrdersScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const ArchiveOrders(),
  ];
  List BottomAppBar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.done},
    {"title": "Archive", "icon": Icons.archive_outlined},
  ];
  @override
  changePage(i) {
    currentPage = i;
    update();
  }
}
