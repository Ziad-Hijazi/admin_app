import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../controller/orders/OrdersScreen_controller.dart';
import '../home/custom_bottom_app_bar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length, ((i) {
              return Expanded(
                child: CustomBottomAppBar(
                  textButton: controller.BottomAppBar[i]['title'],
                  iconData: controller.BottomAppBar[i]['icon'],
                  onPressed: () {
                    controller.changePage(i);
                  },
                  active: controller.currentPage == i ? true : false,
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
