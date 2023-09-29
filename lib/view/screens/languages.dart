import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/localization/changeLocale.dart';
import '../widgets/languages/custom_lang_button.dart';

class Languages extends GetView<LocaleController> {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomLangButton(
              textButton: "28".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.login);
              },
            ),
            CustomLangButton(
              textButton: "29".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoutes.login);
              },
            )
          ],
        ),
      ),
    );
  }
}
