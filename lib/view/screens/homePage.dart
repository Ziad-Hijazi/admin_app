import 'package:admin/core/constants/image_asset.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/homepage_controller.dart';
import '../widgets/home/card_admin_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 150),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CardAdminHome(
                url: AppImageAsset.categories,
                title: "Categories",
                onTap: () {
                  Get.toNamed(AppRoutes.viewCategories);
                },
              ),
              CardAdminHome(
                url: AppImageAsset.orders,
                title: "Orders",
                onTap: () {
                  Get.toNamed(AppRoutes.ordersscreen);
                },
              ),
              CardAdminHome(
                url: AppImageAsset.users,
                title: "Users",
                onTap: () {},
              ),
              CardAdminHome(
                url: AppImageAsset.report,
                title: "Report",
                onTap: () {},
              ),
              // CardAdminHome(
              //   url: AppImageAsset.deliveryTrack,
              //   title: "Track",
              //   onTap: () {},
              // ),
              // CardAdminHome(
              //   url: AppImageAsset.drivethru,
              //   title: "Drivethru",
              //   onTap: () {},
              // ),
              // CardAdminHome(
              //   url: AppImageAsset.delivery,
              //   title: "Delivery",
              //   onTap: () {},
              // ),
              // CardAdminHome(
              //   url: AppImageAsset.person,
              //   title: "Person",
              //   onTap: () {},
              // ),
              CardAdminHome(
                url: AppImageAsset.product,
                title: "Items",
                onTap: () {
                  Get.toNamed(AppRoutes.viewItems);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
